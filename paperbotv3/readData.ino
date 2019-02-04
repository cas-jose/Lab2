#include <FS.h>

void setup()
{

  Serial.begin(115200);
SPIFFS.begin();
  
}

void loop()
{
  File f = SPIFFS.open("/logData.txt", "r");

  if (!f) {
      Serial.println("file open failed");
  }

  
  File h = SPIFFS.open("/frontSensor.txt", "r");

  if (!h) {
      Serial.println("file open failed");
  }

  
  File k = SPIFFS.open("/rightSensor.txt", "r");

  if (!k) {
      Serial.println("file open failed");
  }
  
for (int i=1; i<=100; i++){
    String t=f.readStringUntil('\n');
    Serial.print(i);
    Serial.print(":");
    Serial.println(t);

    String n=h.readStringUntil('\n');
    Serial.print(i);
    Serial.print(":");
    Serial.println(n);

    String s=k.readStringUntil('\n');
    Serial.print(i);
    Serial.print(":");
    Serial.println(s);

        delay(100);
 }



  
}
