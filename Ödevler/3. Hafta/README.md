# HW 3 - Notlar

# 1. Soru

![ezgif com-gif-maker](https://user-images.githubusercontent.com/56068905/202732811-4f546a9a-3ea3-4428-84c9-29ee15a61f07.gif)

## Kodlara ulaşmak için [tıklayınız](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/third-week-homework-ozturkomerfaruk/tree/main/Hw3-1/Hw3-1)

### Şirket Hakkında Sayfası

<img width="300" height= "600" src= "https://user-images.githubusercontent.com/56068905/202904226-2128ea14-c96c-4de7-a831-111d656a6310.png"/>

Bir ImageView altında şirket logosu ve kuruluş tarihi bulunmaktadır. Bu şirketin bütçesinin gelir ve giderlerinin hesaplandığı ve çalışanlarının maaşlarının ödendiği sayfadır. İlk açılış ekranı bu sayfa olmaktadır.

Diğer sayfalara gitmek için Navigation Controller'dan yararlanarak butonlar oluşturdum. Yeni bir çalışan ekleme ve çalışanları görmek için bu butonlara tıklamak gerekir.

Bütçenin negatife düşmesi durumunda, bir uyarı ekranı "Alert" açılmaktadır.

### Çalışan Ekleme Sayfası

<img width="300" height= "600" src= "https://user-images.githubusercontent.com/56068905/202904421-934634b9-024c-4875-95f6-2a0227be007e.png"/>

Çalışan ekleme sayfasında çalışan bilgileri girilmektedir. Bu kapsamda, isim, yaş, evlilik durumu, yaşadığı şehir, memleketi ve çalışanın statüsü bilgilerini içermektedir.

Bilgiler girildikten sonra maaşı belli olmaktadır. Eğer çalışan evliyse fazladan 2500 TL para verilmektedir. Ayrıca çalışanın statüsüne göre maaşında katlanma olmaktadır. Başlangıç seviyesindeyse maaşı 5 bin, orta seviye ise 10 bin ve eğer uzman bir çalışansa maaşı 20 bin lira olmaktadır.

### Çalışan Listeleme Sayfası

<img width="300" height= "600" src= "https://user-images.githubusercontent.com/56068905/202904820-b87c0a29-7371-447d-8175-1e6dbb4778fe.png"/>

Çalışanların listelendiği ekrandır.

### Çalışan Detay Sayfası

<img width="300" height= "600" src= "https://user-images.githubusercontent.com/56068905/202904867-f5612da2-86de-44ce-9016-231a74ffa7bd.png"/>

Çalışanların bilgilerinin listelendiği ekrandır. Bu ekran sayfasına ulaşmak için çalışanların listelendiği sayfada, çalışana tıklama gerçekleştirildiğinde açılmaktadır.

---

# 2. Soru

![ezgif com-gif-maker](https://user-images.githubusercontent.com/56068905/202899463-efd829c9-c6ef-4505-9dfd-1e5ddf310ddc.gif)

## Kodlara ulaşmak için [tıklayınız](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/third-week-homework-ozturkomerfaruk/tree/main/Hw3-2/Hw3-2).

### Hayvanat Bahçesi Hakkında Sayfası

<img width="300" height= "600" src= "https://user-images.githubusercontent.com/56068905/202905926-4d19bd6b-3e28-4f51-b158-e6d9f0b370d8.png"/>

Hayvanat bahçesinin mevcut bütçesini ve su durumunu gösteren ekrandır. Aynı zamanda hayvanat bahçesinin bakıcılarının maaşları da bu ekran üzerinde ödenmektedir.

Navigation Controller'dan yararlanarak ekleme sayfasına ve hayvanların, hayvanat bakıcılarının listelendiği ekranlarına ulaşan butonlar bulunmaktadır.

### Ekleme Sayfası

<img width="300" height= "600" src= "https://user-images.githubusercontent.com/56068905/202906323-85152391-a8dd-49b0-a378-7d418fb995d4.png"/>

Ekleme sayfasında bakıcıların ve hayranların eklenme işlemleri aynı anda yapılabilmektedir. Bunlar için ayrı sayfa oluşturmaya gerek duymadım. Bakıcı eklemek için sadece isim girilmektedir. İsim girilirken numara girilirse uyarı ekranı bastırmaktadır. Hayvanlara bakmak için başka bilgi istenmemektir çalışandan. Hayvan eklenirken, hayvanın ismini girilmesini istedim. Ayrıca şuan hayvanat bahçesinin bakımını sağladığı 3 çeşit hayvan bulunmaktadır. Bu hayvanlardan başkasının kabulu maalesef yapılmamaktadır. Bu hayvanlar; kedi, köpek ve sincaptır. Daha sonra mevcut bulunan hayvan bakıcılarından birinin seçilmesi gerekmektedir. Aksi takdirde hayvan kaydedimi yapılmamaktadır. Bu hayvanat bahçesinde bulunan her hayvan bir bakıcıya zimmetlenir ve o hayvanın tüm bakımı başıboş bırakılmamış olunur. Daha sonra kaydetme işlemi yapılır. Ancak burada önemli husus hayvanların bu bilgilerinin tamamının doldurulmasını zorunlu tutulmaktadır.

Önemli Not: Çalışanların maaşı belirli bir sayı değildir. Bu hayvanat bahçesinde, bakıcı ne kadar fazla hayvanı zimmeti altına alırsa o kadar fazla para kazanır. İlk 9 hayvanda, hayvan sayısı her arttıkça 1000 TL olarak artar. 10 hayvandan sonra 3000 TL olarak artar. Eğer hiçbir hayvana bakmazsa ona para verilmez!

### Hayvanların Listelenme Sayfası

<img width="300" height= "600" src= "https://user-images.githubusercontent.com/56068905/202906408-d31ced54-06b6-4086-9464-4753a36a56df.png"/>

Bu sayfada hayvanların listelendiği gibi aynı zamanda her hayvanın türüne göre hayvan sesi de çıkartmaktadır.

### Çalışanların Listelenme Sayfası

<img width="300" height= "600" src= "https://user-images.githubusercontent.com/56068905/202906460-0166b8ac-a0a6-4ab3-b9de-2e8caf2a38e7.png"/>

Çalışanların listelendiği sayfadır. Her bir çalışana ait olan hayvan sayısı ve maaşı belli olmaktadır.

---

# 3. Soru

![ezgif com-gif-maker](https://user-images.githubusercontent.com/56068905/202902260-4c6893d7-3c8f-4cb0-bfbe-6d67309d898d.gif)

## Kodlara ulaşmak için [tıklayınız](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/third-week-homework-ozturkomerfaruk/tree/main/Hw3-3/Hw3-3).

Butona tıklandığında API'dan gelen veri ile label değişmektedir. Tek ekranlık bir uygulamadır. Navigation'da ki Title ve label, butona basılarak değişmektedir.

---

# Ödev Hakkında Birkaç Söz

Ödevleri elimden geldiğince çaba göstermeye çalıştım ancak eksikliklerim sebebiyle tasarıma çok fazla odaklanamadım. Elimden geldiğince güzel yapmaya çalıştım. İnternetten animasyonlarla ilgili araştırmalar yaptım. Animasyon eklemeye çalıştım ama istediğim gibi olmayınca bari animasyon animasyondur diyerek, bırakmak zorunda kaldım. Elimden geldiğince dosya düzenine dikkat etmeye çalıştım. İsimlendirmelere dikkat etmeye çalıştım. Ödev kapsamında çok fazla yeni şey öğrendim. Bunların en başında Swift'de API verilerini kontrol etmek oldu. Constraint kullanımı oldu. Bu gibi bir çok tecrübe elde ettim. Bunları yakın bir zamanda blog sayfamda yazmayı istiyorum.

Eksiklik olarak nitelendirebileceğim. Bazı verileri class içerisinde 'Static' tutmak oldu. Bu çok yanlış maalesef alışkanlık haline getirmek istemiyorum. Geçici çözüm olarak yaptım. Bunun yerine ne yapılması gerek tam manasıyla bir çözüm bulamadığım için, geçici olarak bu çözümü kullandım. Ancak bootcamp sayesinde çok fazla yeni şey öğreniyorum. Delegation Pattern, Notification gibi. Elimden gelenin en iyisini yapmak istiyorum.

Benim için bırakacağınız her 'issue' benim için altın değerinde olacaktır.
