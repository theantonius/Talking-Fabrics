// show images - done
// connect firmata input
// connect firmata output
// put team names

//firmata stuff
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

PImage[] quizImages = new PImage[32];
int selImage = 0;

color off = color(4, 79, 111);
color on = color(184, 145, 158);

//int[] values = { Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, 
//  Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, 
//  Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW };

void setup() {
  // Prints out the available serial ports.
  println(Arduino.list());
  // select port
  arduino = new Arduino(this, Arduino.list()[1], 57600);

  // Set pins 2, 4, 6, 8 as inputs.
  for (int i = 2; i <= 8; i+=2)
    arduino.pinMode(i, Arduino.INPUT);

  // Set pins 3, 5, 7, 9 as outputs.
  for (int i = 3; i <= 9; i+=2)
    arduino.pinMode(i, Arduino.OUTPUT);

  size(960, 540);
  for (int i = 0; i < quizImages.length; i++) {
    String nameImage = i+".jpg";
    quizImages[i] = loadImage(nameImage);
  }
}

void draw() {
  background(0);
  image(quizImages[selImage], 0, 0);


  // Draw a filled box for each digital pin that's HIGH (5 volts).
  for (int i = 2; i <= 8; i+=2) {
    if (arduino.digitalRead(i) == Arduino.HIGH)
      fill(on);
    else
      fill(off);

    rect(420 - i * 30, 30, 20, 20);
    fill(255);
    text(i, 420 - i * 30, 30);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (selImage>0) {
        selImage--;
      }
    } else if (keyCode == RIGHT) {
      if (selImage<quizImages.length) {
        selImage++;
      }
    }
  }

  if (key == '3') {
    arduino.digitalWrite(3, Arduino.HIGH);
  }
  if (key == '5') {
    arduino.digitalWrite(5, Arduino.HIGH);
  }
  if (key == '7') {
    arduino.digitalWrite(7, Arduino.HIGH);
  }      
  if (key == '9') {
    arduino.digitalWrite(9, Arduino.HIGH);
  } else {
    arduino.digitalWrite(3, Arduino.LOW);
    arduino.digitalWrite(5, Arduino.LOW);
    arduino.digitalWrite(7, Arduino.LOW);
    arduino.digitalWrite(9, Arduino.LOW);
  }
}