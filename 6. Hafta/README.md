# 6. Hafta

## Yazılımcı Egosu Nedir?

Kod taraflarına geçmeden önce üzerinde durduğumuz bir konu oldu bu hafta. Burdan çıkarılacak aslında çok fazla nokta. Ancak ben Ömer Faruk Öztürk olarak karşılaştığım bir iki noktaya değinmek istiyorum.

Daha okul hayatında karşılaştığım bu ego, benim hayatıma daha sonra iş dünyasında da çok fazla karşılaşmama sebep oldu. İnsanda belirli bir seviyede elbette ki ego olmalıdır. Egosuz adamda tabiri caizse ezik bir tip olup çıkıyor. 🙂 Ancak fazla ego; kullandığı teknoloji, yazdığı programlama dilini öyle bir yücelttiriyor ki insana, hiç ama hiç gereği yok. Ben mobil teknolojilerle ilgileniyorum dediğim de, mobil ne yaa diyen insanlar tanıdım. Ya da yazdığım kodu küçümseyen insanlar gördüm. E be eşek! Sen benim seviyemdeyken sanki Aya giden roketin kodunu yazdın! Bura da asıl önemli nokta dışarıda bu egolu insanları görmezden gelicez ve kendimizde de bu maddeler sakınıcaz. Nokta!

* **Hata yapabileceğini öğrenmeli ve bu durumu kabul etmelisin.** 
* **Yazdığın kodda problem olabilir, olayı kişiselleştirme ve hatanı ortaya çıkarmaktan korkma.**
* **Ne kadar çok bildiğin önemli değil, her zaman senden daha çok bilen birileri mutlaka olacaktır.**
* **Birilerine danışmadan varolan kodları değiştirme.**
* **Senden daha az bilen kişilere karşı saygılı ve sabırlı ol.**
* **Değişmeyen tek şey dünyanın her zaman değişmesidir. Sen de değişime her zaman açık ol.**
* **Saygı kazanmanın ve yetkin olmanın asıl kaynağı bilgidir.**
* **Doğru bildiğin şeyler için mücadele et, ama haksız olduğun yerde de doğruları kabullen.**
* **Yalnız takılan yazılımcı olma, herkese açık ol ve yardımlaşmaya önem ver.**
* **İnsanları değil, yazılan kodları eleştir ve yazılımcılara karşı kibar ol.**

Bu maddelerin altını her geçen gün dolduracak çok fazla örneğe şahit oluyorum. Siz siz olun bu egoist insanlar gibi olmayın.!
 
## Swift Access Control

Not: Command + Shift + J -> Ekranda hangi file açıksa gider onu gösterir.

Bu kapmsa Swift'in kullandığı 5 terim var. Bunlar: Open, Public, internal, fileprivate, private

* **private**: Class dışında kullanılamıyor.
* **fileprivate**: Aynı dosya içerisinde birden fazla class da kullanılabiliyor.
* **internal**: Aynı modül içerisinde erişilebilir yapmaktadır. Aynı zamanda default olandır.
* **Public**: Aynı modülden ziyade, farklı modüllerden de erişilebilir yapmaktadır ancak override edilememektedir.
* **Open**: Farklı modüllerden override edilebilir yapmaktadır.

## Cocoapods Kullanımı

İstediğimiz Cocapods'a ulaşmak için önce terminalde cocoapods kurmamız gerekmektedir.

```sudo gem install cocoapods```

Kurma işlemi gerçekleştikten sonra terminal ekranında pod dosyası oluşturmak şu ifadeyi yazmaktayız:

```pod init```

Ardından pod'ları yüklemek için örneğin:

```pod 'AFNetworking', '~> 2.6'```

gibi ifadeler yazılarak pod eklenir. Projeye entegre etmek için:

```pod install```

yazılır ve yeni oluşan ***xcworkspace*** dosyası açılarak proje yönetimi gerçekleşmeye başlanır.

## Alamofire

Proje içerisinde CocaPods ile Alamofire ve AlamofireImage 3. part kütüphaneleri entegre edilmiştir.

```
pod 'Alamofire'
pod 'AlamofireImage', '~> 4.1' 
```

## MVC Kullanımı

**Önemli Not** Bu API_KEY kullanımı saklı bir yerlerden gelmesi gerekmekte. Başka bir file'dan olabilir ya da daha derin bir yerlerden Keychain den felan gelmesi lazım. Gizli bilgi, erişelememesi gerekmekte.

Bunu derinlemesine bi araştırmam gerekiyor. Burada maksat MVC olduğu için çok fazla kasmadan direk yazdım ama normalde olması gereken API_KEY'in erişilememesi gerekmektedir. Bu kapsamda da Git'de silmekteyim.

Dosyalaması şu şekildedir.

<img width="270" alt="image" src="https://user-images.githubusercontent.com/56068905/206101392-89ba4b12-31e7-4009-93e7-2a03fcb06e0a.png">

## Protocol Oriented MVVM

**Not** Mesela şirketlerde 3 ekip bulunmaktadır. Feature geliştiren bir ekip, alt yapıyı geliştiren bir ekip bir de Fauture geliştiren ekipten kalan bugları çözüyor ya da 3 ayrı ekip 3'ünü de yapıyor. Ancak burada önemli olan kısım bir MVVM mimarisini geliştiren ekibin birbiri içerisinde organizasyonu lazımdır.


