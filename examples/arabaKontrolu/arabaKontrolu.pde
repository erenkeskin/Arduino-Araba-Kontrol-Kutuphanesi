// Kütüphanemizi dahil ediyoruz.
#include "ArabaKontrol.h"

// Nesnemizi Oluşturuyoruz.
// parametreler: (solMotorPin1, solMotorPin2, sagMotorPin1, sagMotorPin2, solMotorHiz, sagMotorHiz)
Araba calistir(3, 4, 7, 8, 5, 6);  

void setup() {
  
  Serial.begin(9600);
  
}

void loop() {

  /*
    Aracın Yön Kontrol Fonksiyonlarının kullanımı
  */
  calistir.ileri(255);     // aracın 255 PWM değerinde ileri gitmesini sağlıyoruz.
    delay(1500);
  calistir.geri(255);      // aracın 255 PWM değerinde geri gitmesini sağlıyoruz.
    delay(1500);
  calistir.sag(255);       // aracın 255 PWM değerinde sağa gitmesini sağlıyoruz.
    delay(1500);
  calistir.sol(255);       // aracın 255 PWM değerinde sola gitmesini sağlıyoruz.
    delay(1500);
  calistir.dur();          // aracın durmasını sağlıyoruz.
    delay(1500);

  /*
    Aracın Far Kontrol Fonksiyonlarının kullanımı
  */
  calistir.sagFar(10, HIGH);        // aracın sağ farını yakıyoruz.
    delay(1000);
  calistir.sagFar(10, LOW);         // aracın sağ farını söndürüyoruz.
    delay(1000);
  calistir.solFar(11, HIGH);        // aracın sol farını yakıyoruz.
    delay(1000);
  calistir.solFar(11, LOW);         // aracın sol farını söndürüyoruz.
    delay(1000);
  calistir.dortlu(10, 11, HIGH);    // aracın dörtlülerini yakıyoruz.
    delay(1000);
  calistir.dortlu(10, 11, LOW);     // aracın dörtlülerini söndürüyoruz.
    delay(1000);
  
}

