/*
The sketch demonstrates how to detect a Bluetooth Low Energy 4
connection with the RFduino.
*/

#include <RFduinoBLE.h>

// pin 3 on the RGB shield is the green led
// (shows when the RFduino is advertising or not)
int sending_led = 3;

// pin 2 on the RGB shield is the red led
// (goes on when the RFduino has a connection from the iPhone, and goes off on disconnect)
int connection_led = 2;

void setup()
{
  // led used to indicate that the RFduino is advertising
  pinMode(sending_led, OUTPUT);
  //digitalWrite(sending_led, HIGH);
  
  // led used to indicate that the RFduino is connected
  pinMode(connection_led, OUTPUT);
  //digitalWrite(connection_led, HIGH);
  
  // start the BLE stack
  RFduinoBLE.begin();
  
  //Serial.begin(9600);
    // switch to lower power mode
  RFduino_ULPDelay(INFINITE);
}

void loop() 
{
}

void RFduinoBLE_onAdvertisement(bool start)
{
  //Serial.println(" adv ");
}

void RFduinoBLE_onReceive(char *data, int len) {
  
  //Serial.println(" rec ");
  char buf[5] = {'h', 'e', 'l', 'l', 'o' };
  RFduinoBLE.send(buf, 5);
  
  digitalWrite(sending_led, HIGH);
  delay(500);
  digitalWrite(sending_led, LOW);
}

void RFduinoBLE_onConnect()
{
  //Serial.println(" conn ");
  digitalWrite(connection_led, HIGH);

}

void RFduinoBLE_onDisconnect()
{
  //Serial.println(" discon ");
  digitalWrite(connection_led, LOW);
}
