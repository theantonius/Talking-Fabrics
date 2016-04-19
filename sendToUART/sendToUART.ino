// alternate between sending H or L
// taken from http://robotic-controls.com/learn/arduino/arduino-arduino-serial-communication

void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print('H');
  delay(1000);
  Serial.print('L');
  delay(1000);
}
