#include "ArabaKontrol.h"

Araba araba(3, 4, 7, 8, 5, 6); // parametreler: (solMotorPin1, solMotorPin2, sagMotorPin1, sagMotorPin2, solMotorHiz, sagMotorHiz)

void setup() {
  
  Serial.begin(9600);
  
}

void loop() {

  araba.ileri(255);
  delay(1500);
  araba.geri(255);
  delay(1500);
  araba.sag(255);
  delay(1500);
  araba.sol(255);
  delay(1500);
  araba.dur();
  delay(1500);
  
}


