/*
  ArabaKontrol.h - Aracı kontrol etmek için gerekli komutların tanımlarının yapıldığı dosya
  Hasan Eren Keskin tarafından oluşturuldu
  26.01.2017
  .... adresinde paylaşıldı.
*/

#ifndef ArabaKontrol_h
#define ArabaKontrol_h

#include "Arduino.h"

class Araba {

  public:
    Araba(int, int, int, int, int, int);  // parametreler: (solMotorPin1, solMotorPin2, sagMotorPin1, sagMotorPin2, solMotorHiz, sagMotorHiz)
    void ileri(int);
    void geri(int);
    void sol(int);
    void sag(int);
    void dur();
    void solFar(int, int);
    void sagFar(int, int);
    void dortlu(int, int, int);

  private:
    int sol1, sol2, sag1, sag2, hiz1, hiz2;

};

#endif

