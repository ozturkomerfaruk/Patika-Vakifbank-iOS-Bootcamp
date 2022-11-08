# Protocol

Protocol en dışarıda yazılan ve altında class, struct, enum gibi yapıların yazılabildiği soyut kavramlardır. Alttaki resimde protocolun altında class ve struct bulunmaktadır. Normal en dışarıdan onları sarmalamıştır. Burada başka bir espiri yok.

<img width="586" alt="image" src="https://user-images.githubusercontent.com/56068905/200521153-b36f0d5f-eacc-413e-ab47-76e0edec61e2.png">

Verilen iki sayıdan birini random olarak verecek bir fonksiyon yazdırmak istiyoruz. Ancak protocol ile bu fonksiyonu en dışarıdan çağırıyoruz. Böylelikle farklı yerlerde de bunu kullanmayı amaçlıyoruz diyelim. Protocol unu yazdık. Devamında Random adında bir sınıf oluşturup Bool.random() metodundan yardım alıyoruz.

<img width="438" alt="image" src="https://user-images.githubusercontent.com/56068905/200521812-97773a76-2a16-4fb0-9ad7-7d54153115bc.png">

protocol içerisinde değiştirilebilir fonksiyonlara mutating ekleyebiliyoruz. Buna örnek olarak da switch butonunda ki değişimi gösteren bir enum oluşturalım. Burada enum içerisinde bir fonksiyon çalıştırabiliyoruz. Extensin yazmaya gerek kalmadan case lerin hemen altında toggle fonksiyonuna mutating ile erişim sağlayabiliyoruz.

<img width="450" alt="image" src="https://user-images.githubusercontent.com/56068905/200521850-fbeeb9dd-c8af-447b-8926-68422e308b51.png">

Protocollere init ekleyebiliyoruz. Bu altındaki bütün classlarda çağrılıyor. Bunu required tag i ile çağırmak gerekiyor. Eğer required olarak gelen initi değiştirmek istiyorsak mesela bir subClass da parametresiz çağıracaksak override edebiliyoruz.

<img width="573" alt="image" src="https://user-images.githubusercontent.com/56068905/200521914-d3f94914-f238-4b94-ba7d-20b1c5516e62.png">

Protocoller değişkenler olarak da çağrılabiliyor. Benim de en çok şaşırdığım nokta burası oldu. Değişken olarak gösterip içerisine fonksiyon felan çalıştırıp dönen değeride başka bir şey için kullanabiliyorsun. Not alınması gereken bir nokta!!

<img width="617" alt="image" src="https://user-images.githubusercontent.com/56068905/200521941-87dd23f2-caac-49a8-85d0-5d6c0da2fdfd.png">

Protokol içerisindeki metotlarda, generic tipleri kullanabilmek için “associatedtype” anahtar kelimesine ihtiyaç duyarız. Bu anahtar kelime ile tanımladığımız generic tipi, protokolü eklediğimiz sınıf vb. yapılarda belirlememiz gerekmektedir. Peki nasıl yapacağız, örnek ile açıklamaya çalışalım:

Yukarıda tanımladığımız sınıflar AssociatedTypes protokolümüzü conform etti ve içlerinde typealias anahtar kelimesini kullanarak T tipimizin aslında hangi tip olacağını belirledik. Örneklerde iki farklı tipte belirledik ancak sayıyı artırabiliriz.

Not: Eğer AssociatedTypes protokolü içine bir değişken eklemiş olsaydık ve bu değişken de protokol içinde belirlediğimiz generic tipte olur ise conform ettiğimiz sınıf vb. içerisinde “typealias” kullanarak tipi belirlemeye gerek kalmaz çünkü;  conform ettiğimiz sınıf protokol içine yazdığımız değişkenin tipini bizden isteyecektir. Örnek üzerinde bakalım:

```
protocol AssociatedTypes {
    associatedtype T
    func printData(data: T)
}
 
extension AssociatedTypes{
    func printData(data: T){
        print(data)
    }
}
class Employer: AssociatedTypes{
    typealias T = String
 
    func printMyPosition(){
        self.printData(data: "I'm an employer")
    }
}
 
class Employee: AssociatedTypes{
    typealias T = Int
 
    func printMyWorkYears(){
        self.printData(data: 17)
    }
}
```
Protokol ve sınıfımızı güncellediğimizde “typealias” anahtar kelimesini kullanmaya gerek kalmadığı görülecektir.
```
protocol AssociatedTypes{
    associatedtype T
    
    var items: [T] {get set}
    func printData(data: T)
}
 
class Employer: AssociatedTypes{
    var items: [String] = []
 
    func printMyPosition(){
        self.printData(data: "I'm an employer")
    }
}
```

Şimdi bir protocol oluşturacağım ve oluşturduğum protocol yardımıyla bir Container üreteceğim. Ürettiğim Container ile başka bir container daha üretip kıyaslamalarını generic where kullanımı ile yapacağım.

Container protokolunde **associatedtype** ile T tipinde Item oluşturuyorum. Bunun yardımı ile append'imi tanımlıyabiliyorum. İçerisine String de gelebilir, double da. Subscript ile 

<img width="357" alt="image" src="https://user-images.githubusercontent.com/56068905/200510737-c3be20c0-949c-43e1-9210-88dd96e4b5dc.png">

NewIntStack içerisinde bulunan append, count ve subscript protocolden gelmektedir. Onlar normal bir şekilde kodları yazılabilmektedir. Burada iki tane de method eklenmiş ve onlarda Stack adı altında çalışmaktadırlar. Bunun içinde yine bir Array kullanılmıştır. typealies, protocolde ki Item'lere ulaşıp diyorki ben sana Int göndereceğim. Ona göre düzenlemeleri yap.

<img width="387" alt="image" src="https://user-images.githubusercontent.com/56068905/200510773-d703fb22-8c80-4429-a924-139f8bf91087.png">

Equatable eklenmesi iki Item arasında karşılaştırmalar yapabilmeyi izin vermektedir.

<img width="386" alt="image" src="https://user-images.githubusercontent.com/56068905/200510818-ef87e5bc-de0e-43c1-87da-c1d817c7cd74.png">

Aynı Container'dan türeyen C1 ve C2 param altında dışarıdan 2 tane Container fonksiyona girmektedir. Bool olarak true ya da false output vermektedir. Bunu where kullanarak yapmaktayız. Equatable başlığı altında count aynı mı, ve index index aynı mı.

<img width="864" alt="image" src="https://user-images.githubusercontent.com/56068905/200510922-0e2ad382-b711-4f1d-b420-de47068c2e58.png">

Bir Stack içerisinde de aynı şekilde generic where yapabilirim.

<img width="480" alt="image" src="https://user-images.githubusercontent.com/56068905/200511089-ade2e3dc-30dd-44c7-a8a8-db6074498585.png">

Aynı şekilde:

```
struct NotEquatable {}
var notEquatableStack = Stack<NotEquatable>()
let element = NotEquatable()
notEquatableStack.push(element)
//notEquatableStack.isTop(element)
//Generic Subscripts
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
        var result: [Item] = []
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}
```

