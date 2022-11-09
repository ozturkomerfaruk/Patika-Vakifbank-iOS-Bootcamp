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


# Delegate Pattern

Bir view controllerdan diğerine geçerken veri aktarmanın farklı yöntemleri vardır ve rahatlıkla yapılabilir. Ancak geçtiğimiz view controllerdan geri dönerken veri aktarmak istediğimizde veya bir metodu tetiklemek istediğimizde ilk duruma göre biraz daha karışık bir yapı ile uğraşmamız gerekir. Bu yapılardan bir tanesi delegate yapısıdır. Bir senaryo belirleyim:

İki adet View Controller var. Bunlar MainViewController ve CustomPopUViewController

CustomPopUpView, MainView üzerine bir pop up present açıyor ve pop up içindeki butona bastığında pop up dismiss ediliyor. MainView içindeki bir metodu da tetiklemek istiyorum bir yandan.

Ne oldu PopUp bir görünüm açtı dismiss edildi daha sonra. Dismiss edildikten sonra ben Maine ulaşacağım ama nasıl?

## Ek Olarak

Bir objeyi başka bir objeye işi yaptırmasıdır esasında. Bir class da 4 iş yapmaktansa 4 farklı class da ayrı ayrı 4 iş yaptırmak daha mantıklıdır.

Delegation protocol ile başlar
Ne oldu PopUp bir görünüm açtı dismiss edildi daha sonra. Dismiss edildikten sonra ben Maine ulaşacağım ama nasıl?

<img width="632" alt="image" src="https://user-images.githubusercontent.com/56068905/200863623-c5e35eed-bf0d-4361-a506-66f795b2669a.png">

AnyObject ile sadece classlar bağlansın. Aynı zamanda weak kullanımı için gerekli olmaktadır. Delegate ler hep weak olarak eklendiği için AnyObject lazım oluyor.

<img width="639" alt="image" src="https://user-images.githubusercontent.com/56068905/200863701-a2f56282-f761-4e26-b111-89deda4cd66f.png">

<img width="642" alt="image" src="https://user-images.githubusercontent.com/56068905/200863763-41fa9b19-6ab2-4eee-aa54-e337afbc7779.png">

<img width="639" alt="image" src="https://user-images.githubusercontent.com/56068905/200863806-3580564e-90e5-489b-abc4-5d89ccc395d0.png">

<img width="290" alt="image" src="https://user-images.githubusercontent.com/56068905/200863960-a4e4f397-abc2-4954-806e-04b632ff57e0.png">

1. Evet şimdi olan şey şu. Br tane ptorocol var elimde. En temel olan. Orada en temel şey var. Ne var? Zar var ve oynatma işlemi var. Bu kadar.
2. İkinci bir protocol daha var. Oyunu başlatma, oyunu sonlandırma ve oyun kısmı var. Neden anyObject ve neden ptorocol bu? Çünkü farklı classların da bu protocole bağlanması için. Aynı zamanda weak olarak delegatelerin çağrıldığı için eklenmesi gerekiyor. Devamında daha iyi anlaşılacak.
3. İlk protocolden türeyen bir class bu. İlk başta obje olarak bir tane Zar üretildi ve zar değeride. delegate diye weak olarak bir değişken tanımlanıyor. Daha sonra bu delageti protocol olarak atayacağız.
    Daha sonra oynatma fonksiyonu, protocolden gelen, tanımlanıyor. Burada önemli olan, delegate yapısının kullanım şekli.
4. Daha sonra bi logger tanımlanıyor. Delegate kısmında olan yerleri ayrı bir şekilde kullanabilmek için. Yani ilk başta dediğimiz olaya geliyor bu durumda. Benim yapmam gereken işleri, bir başkasına yaptırmak gibi düşünebilirsiniz. 
5. logger ve game classları üretiliyor. logger delegate olarak atanıyor ve oyun başlatılıyor. İşlem başarılı 👍
6. deneme olarak başka bir delegate için class türetelim ve onu atayalım.

<img width="642" alt="image" src="https://user-images.githubusercontent.com/56068905/200866226-4fdc779f-bb5b-4f2c-a3dc-c4141f059b74.png">

Bahsi geçen Dice Classı

<img width="612" alt="image" src="https://user-images.githubusercontent.com/56068905/200864930-376e86ef-e7cf-4eff-8b98-8073c0a87350.png">

Random Classı ve RandoProtocolü

<img width="464" alt="image" src="https://user-images.githubusercontent.com/56068905/200865056-ecdba7cf-73be-4537-ba0c-b4d027005539.png">

Bunlarında bir espirisi yok. Delegate yapısı bu kadar. Gayet anlaşılır bence.


## Protocol'e extension

<img width="635" alt="image" src="https://user-images.githubusercontent.com/56068905/200866544-83075915-95f1-42f6-b16c-17a7f5131018.png">

## Protocolden türeyen objeler için Array extension

<img width="643" alt="image" src="https://user-images.githubusercontent.com/56068905/200866731-767dd22b-1f90-4bc4-87c6-77024a29c817.png">

## Declaring Protocol Adoption with Extension

<img width="629" alt="image" src="https://user-images.githubusercontent.com/56068905/200868350-257aa8a5-6f93-490e-897e-22d62e479342.png">

Burada önemli olan bir nokta var. Protocolden bir değişken oluşturuluyor ve bunu Struct'tan türeyen bir nesneden atama yaptırılıyor. Ben gerçekten bu cümleyi ilk başta anlamamıştım. Çok garibime gidiyor hala ama düşününce de çok mantıklı. Protocol ve Struct içerisinde bir tane String bulunuyor ve atama yaptırılabilmesi çok mantıklı.


## Collection olarak protocol

<img width="634" alt="image" src="https://user-images.githubusercontent.com/56068905/200868989-cd8312fa-c9c2-440f-8d48-21b5e106f93d.png">

## Inheritence

<img width="637" alt="image" src="https://user-images.githubusercontent.com/56068905/200869069-6493cf9e-5067-47d8-8e16-518013ffa8fc.png">

## Composition

<img width="643" alt="image" src="https://user-images.githubusercontent.com/56068905/200869174-8742dc9b-2927-425b-81a9-16ca4ba107cc.png">

Burada Struct da iki tane protocol tanımlanmaktadır. Bunun değişkeni de bu şekilde composition yapılmaktadır

Bundan sonrasını direk kod olarak atıyorum.

```
//------------

//Checking for Protocol Conformance
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.14
    var radius: Double
    var area: Double {
        return pi * radius * radius
        
    }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [Circle(radius: 2.0), Country(area: 243000), Animal(legs: 4)]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

//Protocol Extensions
extension RandomGeneratorProtocol {
    func randomBool() -> Bool {
        return randomGenerator() > 0.5
    }
}

let generator = Random(first: 0.1, second: 0.8)
print("Here's a random number: \(generator.randomGenerator())")
print("And here's a random Boolean: \(generator.randomBool())")


//Providing Default Implementations
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}
```
