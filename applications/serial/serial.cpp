#include "application.h"

void setup() {
  Serial.begin(9600);
  delay(5000)
}

void loop () {
  Serial.println("Hello 9600-bits-per-seconds world. Why so slow?");
  delay(1000);
}
