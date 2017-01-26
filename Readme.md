Daha önce [L298N entegresinin nasıl kullanıldığını](http://herenkeskin.com/arduino-l298n-motor-surucu-entegresi-kullanimi/) ve [Arduino ve Android cihaz kullanarak arabamızı nasıl kontrol edeceğimize](http://herenkeskin.com/arduino-ve-android-telefon-ile-bluetooth-kontrollu-araba-yapimi/) dair yazılar yazmıştım. Bu yazımda ise o projeleri biraz daha geliştirip herkesin hemen ve kolaylıkla kullanabileceği bir kütüphane yazdım ve paylaşmak istiyorum.

Kütüphane kullanmamızın avantajları ve dezavantajları olabilir. Avantajlarından bazıları, fonksiyonları tek tek elimizle yazmak yerine hazır olarak ulaşılabilir bir şekilde elde ederiz. Dökümantasyonlarını inceleyerek hangi fonksiyonların ne işe yaradığını öğrenebiliriz. Dezavantajları ise kullandığımız programda sadece bir fonksiyonu kullanmak varken, kütüphaneyi dahil ederek tüm fonksiyonları dosyamıza çağırmış oluruz ve bu da fazladan boyuta yol açar.
## Kullanmaya Başlayalım 
Benim bu kütüphaneyi yazmamdaki amaç, sadece motor pinlerinin girilmesi ile harekete hazır bir arabamızın olmasıdır. Bunun için kütüphanemizi dahil ettikten sonra bir Araba nesnesi oluşturmamız gerekiyor. Daha önce kütüphaneler kullandıysanız nesnelerin nasıl oluşturulacağını az çok biliyorsunuzdur. Kütüphane eklendikten sonra ilk eklemeniz gereken kod aşağıdaki gibidir.
```sh 
Araba calistir(3, 4, 7, 8, 5, 6);
```
Bu kod artık kütüphane içerisindeki kodlarımızı "calistir" nesnesi ile birlikte kullanabileceğimizi ifade eder. Nesnemizin parametreleri ise şu şekilde.
```sh 
Pin 3 ---->  Sol Motorun 1. Çıkışı
Pin 4 ---->  Sol Motorun 2. Çıkışı

Pin 7 ---->  Sağ Motorun 1. Çıkışı
Pin 8 ---->  Sağ Motorun 2. Çıkışı

Pin 5 ---->  Sol Motorun Enable (Hız Kontrolü Yapacağımız) Çıkışı
Pin 6 ---->  Sağ Motorun Enable (Hız Kontrolü Yapacağımız) Çıkışı
```
Burada dikkat etmemiz gereken nokta motorların enable (hız kontrol) pinlerinin PWM sinyali verebilecek pinler olmasıdır. PWM sinyali veren pinler Arduino Uno'da 3, 5, 6, 9, 10, 11. pinlerdir. Çeşitli Arduino modelleri için farklılık gösterebilir.

## Fonksiyonlar ve Kullanımları
Motor tanımlamamızı yaptıktan sonra kullanabileceğimiz fonksiyonlara geçebiliriz. Kütüphane içerisinde şu an kullanıma hazır 8 fonksiyon bulunuyor. Fonksiyonların listesi ve kullanım talimatları aşağıdaki gibidir.
```sh
// Aracın durması için kullanması gereken fonksiyon.

dur();

// Aracın ileri yönde hareket etmesini sağlar.
// İçerisine hız parametresi alarak hız kontrolü yapabilirsiniz.

ileri( int hizDegeri );

// Aracın geri yönde hareket etmesini sağlar. 
// İçerisine hız parametresi alarak hız kontrolü yapabilirsiniz.

geri( int hizDegeri );

// Aracın sol yönde hareket etmesini sağlar.
// İçerisine hız parametresi alarak hız kontrolü yapabilirsiniz.

sol( int hizDegeri );

// Aracın sağ yönde hareket etmesini sağlar.
// İçerisine hız parametresi alarak hız kontrolü yapabilirsiniz.

sag( int hizDegeri );

// Parametre olarak far olarak kullandığınız led pinini ve yanmasını mı sönmesini mi istediğinizi belirtmeniz gerekiyor.

solFar( int farPini, int durum );

// Parametre olarak far olarak kullandığınız led pinini ve yanmasını mı sönmesini mi istediğinizi belirtmeniz gerekiyor.
                                                                  
sagFar( int farPini, int durum );

// Parametre olarak far olarak kullandığınız led pinlerini ve yanmasını mı sönmesini mi istediğinizi belirtmeniz gerekiyor.

dortlu( int solFarPini, int sagFarPini, int durum );
```

## Örnek kullanım dosyası
Fonksiyonların kullanımları bu şekilde. İsterseniz örnek bir kodla nasıl kullanıldıklarını görelim.
```sh
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
```
Bağlantılarınızı yaptıktan sonra fonksiyonları test ederken Seri Monitörü kullanarak fonksiyonların çalışıp çalışmadığını kontrol edebilirsiniz. Her fonksiyon kendine özgü değerleri ekrana bastırıyor.

Her şeyi uygun yaptığınızı düşünüyorsanız ama yine de araçtan bir tepki alamıyorsanız ilk önce bağlantınızı, daha sonra da kod içerisinde nesne oluştururken belirtmiş olduğunuz pinlerin doğru şekilde olup olmadığını tekrar kontrol edin. Yine çözemezseniz, yorum bölümünden ve ya iletişim sayfamdan benimle iletişime geçebilirsiniz.

Projenin blogumdaki yazısını okumak için: [Arduino ile Araba Kontrol Kütüphanesi - Herenkeskin](link)