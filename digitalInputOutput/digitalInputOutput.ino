// Digital Input/Output between two Arduinos
// by http://antoni.us
int led = 13;

// the setup routine runs once when you press reset:
void setup() {
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);
  pinMode(8, INPUT);
  
  // make pin 6 input, 7 output
  pinMode(6, INPUT);
  pinMode(7, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  
  // check if my button is pressed.
  if(digitalRead(8)==HIGH){ // if button is pressed, tell the other Arduino.
    digitalWrite(7,HIGH);
  } else{
    digitalWrite(7,LOW);
  }
  
  if(digitalRead(6)==HIGH){ // if the input from the other Arduino is HIGH
    digitalWrite(led, HIGH);   // turn the LED on (HIGH is the voltage level)
  } else{
  digitalWrite(led, LOW);    // turn the LED off by making the voltage LOW
  }
  delay(10);               // wait
  
}
