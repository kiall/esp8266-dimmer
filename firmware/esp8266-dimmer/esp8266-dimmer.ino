#include <ESP8266MQTTClient.h>
#include <ESP8266WiFi.h>
#include <ESP8266mDNS.h>
#include <ArduinoOTA.h>

MQTTClient mqtt;

const char* HOSTNAME = ("esp8266-dimmer-" + String(ESP.getChipId())).c_str();
const char* WIFI_SSID = "<Wifi Name Here>";
const char* WIFI_PASSWORD = "<Wifi Password Here>";
const char* OTA_PASSWORD = "<OTA Password Here>";
const String MQTT_URI = "mqtt://<MQTT Server Here>:1883";

const int AC_PIN = 13;                           // Output To Dimming Circuit
const int ZC_PIN = 12;                           // Input from Zero Cross Detection Circuit
const int STATE_TIMER_INTERVAL = 80000000L;      // Timer interval in clock cycles. 80Mhz, so 80000000L cycles a second.
const int DIMMER_TIMER_INTERVAL = 6000;          // Timer interval in clock cycles. 80Mhz, so 80000000L cycles a second.

const String COMMAND_TOPIC = "esp8266-dimmer/" + String(ESP.getChipId()) + "/command";
const String STATE_TOPIC = "esp8266-dimmer/" + String(ESP.getChipId()) + "/state";
const String BRIGHTNESS_COMMAND_TOPIC = "esp8266-dimmer/" + String(ESP.getChipId()) + "/brightness/command";
const String BRIGHTNESS_STATE_TOPIC = "esp8266-dimmer/" + String(ESP.getChipId()) + "/brightness/state";

bool POWER_ON = false;
int BRIGHTNESS = 128;   // Dimming level (0-128)  0 = ON, 128 = OFF

volatile boolean ZC_DETECTED = false;
volatile int ZC_COUNTER = 0;
volatile boolean STATE_UPDATE_DUE = true;

void setup() {
  Serial.begin(74880);
  Serial.println("Booting");

  setupWifi();
  setupOta();
  setupGpio();
  setupMqtt();
  setupTimers();

  Serial.println("Booted");
}

void setupWifi() {
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Wifi Connecting");

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.print("\n");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void setupOta() {
  ArduinoOTA.setHostname(HOSTNAME);
  ArduinoOTA.setPassword(OTA_PASSWORD);

  ArduinoOTA.onStart([]() {
    disableTimers();
    noInterrupts();

    sendStatusUpdate();
    Serial.println("OTA Start");
  });

  ArduinoOTA.onEnd([]() {
    Serial.println("\nOTA End");
  });

  ArduinoOTA.onProgress([](unsigned int progress, unsigned int total) {
    Serial.printf("OTA Progress: %u%%\r\n", (progress / (total / 100)));
  });

  ArduinoOTA.onError([](ota_error_t error) {
    Serial.printf("OTA Error[%u]: ", error);
    if (error == OTA_AUTH_ERROR) Serial.println("OTA Auth Failed");
    else if (error == OTA_BEGIN_ERROR) Serial.println("OTA Begin Failed");
    else if (error == OTA_CONNECT_ERROR) Serial.println("OTA Connect Failed");
    else if (error == OTA_RECEIVE_ERROR) Serial.println("OTA Receive Failed");
    else if (error == OTA_END_ERROR) Serial.println("OTA End Failed");
  });

  Serial.println("OTA Setup");
  ArduinoOTA.begin();
}

void setupGpio() {
  pinMode(AC_PIN, OUTPUT);
  attachInterrupt(digitalPinToInterrupt(ZC_PIN), onZeroCrossing, RISING);
}

void setupMqtt() {
  mqtt.onData([](String topic, String data, bool cont) {
    Serial.printf("Data received, topic: %s, data: %s\r\n", topic.c_str(), data.c_str());
    if (topic == COMMAND_TOPIC) {
      onCommand(data);
    } else if (topic == BRIGHTNESS_COMMAND_TOPIC) {
      onBrightnessCommand(data);
    } else {
      Serial.println("Unknown topic: " + topic);
    }
  });

  mqtt.onSubscribe([](int sub_id) {
    Serial.printf("Subscribe topic id: %d ok\r\n", sub_id);
  });

  mqtt.onConnect([]() {
    Serial.printf("MQTT: Connected\r\n");

    mqtt.subscribe(COMMAND_TOPIC);
    mqtt.subscribe(BRIGHTNESS_COMMAND_TOPIC);
  });

  Serial.println("MQTT Connecting");
  mqtt.begin(MQTT_URI);
}

void setupTimers() {
  noInterrupts();

  timer0_isr_init();
  timer0_attachInterrupt(onDimmerTimer);

  resetDimmerTimer();

  timer1_isr_init();
  timer1_enable(TIM_DIV16, TIM_EDGE, TIM_SINGLE);
  timer1_attachInterrupt(onStateTimer);

  resetStateTimer();

  interrupts();
}

void disableTimers() {
  noInterrupts();
  timer0_detachInterrupt();
  timer1_disable();
  timer1_detachInterrupt();
  interrupts();
}

void resetDimmerTimer() {
  timer0_write(ESP.getCycleCount() + DIMMER_TIMER_INTERVAL);
}

void resetStateTimer() {
  timer1_write(STATE_TIMER_INTERVAL);
}

void loop()  {
  mqtt.handle();
  ArduinoOTA.handle();

  if (STATE_UPDATE_DUE == true) {
    sendStatusUpdate();
  }
}

void setPowerState(boolean state) {
  if (state == true) {
    setBrightness(0);
  } else {
    setBrightness(128);
  }
}

void setBrightness(int brightness) {
  Serial.println("Setting Brightness to: " + String(BRIGHTNESS));

  BRIGHTNESS = brightness;

  if (brightness == 128) {
    POWER_ON = false;
  } else {
    POWER_ON = true;
  }

  STATE_UPDATE_DUE = true;
}

void onCommand(String data) {
  if (data == "ON") {
    Serial.println("Setting Power ON");
    setPowerState(true);
  } else if (data == "OFF") {
    Serial.println("Setting Power OFF");
    setPowerState(false);
  } else {
    Serial.println("Unknown command payload: " + data);
  }

  STATE_UPDATE_DUE = true;
}

void onBrightnessCommand(String data) {
  // TODO: Bad Data Handling
//  Serial.println("Setting Brightness to: " + data);

  int inverseBrighness = data.toInt();
  setBrightness((inverseBrighness * -1) + 128);
}

void onZeroCrossing() {
  if (POWER_ON == true) {
      ZC_DETECTED = true;
      ZC_COUNTER=0;
  }

  digitalWrite(AC_PIN, LOW);
}

void onDimmerTimer() {
//  Serial.println("Dimmer Timer");
  if (ZC_DETECTED == true) {
    if (ZC_COUNTER >= BRIGHTNESS) {
      digitalWrite(AC_PIN, HIGH);
      ZC_COUNTER = 0;
      ZC_DETECTED = false;
    } else {
      ZC_COUNTER++;
    }
  }

  resetDimmerTimer();
}

void onStateTimer() {
  STATE_UPDATE_DUE = true;
  resetStateTimer();
}

void sendStatusUpdate() {
  STATE_UPDATE_DUE = false;

  if (POWER_ON == true) {
    mqtt.publish(STATE_TOPIC, "ON");
  } else {
    mqtt.publish(STATE_TOPIC, "OFF");
  }
  //  Serial.println("Brightness: " + String((BRIGHTNESS * -1) + 128));
  mqtt.publish(BRIGHTNESS_STATE_TOPIC, String((BRIGHTNESS * -1) + 128));
}

