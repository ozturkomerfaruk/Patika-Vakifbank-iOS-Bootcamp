# 6. Hafta

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

```ìnit pod```

Ardından pod'ları yüklemek için örneğin:

```pod 'AFNetworking', '~> 2.6'```

gibi ifadeler yazılarak pod eklenir. Projeye entegre etmek için:

```pod install```

yazılır ve yeni oluşan ***xcworkspace*** dosyası açılarak proje yönetimi gerçekleşmeye başlanır.

## Alamofire

Proje içerisinde CocaPods ile Alamofire ve AlamofireImage 3. part kütüphaneleri entegre edilmiştir.

## MVC Kullanımı

Dosyalaması şu şekildedir.

<img width="270" alt="image" src="https://user-images.githubusercontent.com/56068905/206101392-89ba4b12-31e7-4009-93e7-2a03fcb06e0a.png">
