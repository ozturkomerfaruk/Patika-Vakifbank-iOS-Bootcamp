# NeworlD Oyun Uygulaması

## Önemli Not!!

Proje içerisinde API_KEY kullanımına izin vermedim. Bunun için App klasörünün altında bulunan Utils klasorüne gidip Constants dosyasında kendi API_KEY'inizi oluşturup ekleyiniz lütfen. Aksi takdirde uygulamaya giriş yapmak istediğinizde uygulama açılmayacaktır.

<img width="276" alt="image" src="https://user-images.githubusercontent.com/56068905/208318476-c4877f9e-a3f3-45f0-80fd-0d5078908eac.png">

Oluşturacağınız RawG API_KEY aşağıdaki ekran görüntüsündeki internet sitesidir. Siteye gitmek için [tıklayabilirsiniz](https://rawg.io/apidocs).

<img width="600" alt="image" src="https://user-images.githubusercontent.com/56068905/208318496-b5e51dd3-c882-4973-9c3e-2232befc7fbb.png">


## İçindekiler

* [Bitirme Projesi NeworlD uygulama ikonu](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#bitirme-projesi-neworld-uygulama-ikonu)
* [Bitirme Projesi Hazırlık Dökümanı](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#bitirme-projesi-haz%C4%B1rl%C4%B1k-d%C3%B6k%C3%BCman%C4%B1)
* [Proje Gereksinimler Hakkında](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#proje-gereksinimler-hakk%C4%B1nda)
* [Ekran Görüntüleri](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#ekran-g%C3%B6r%C3%BCnt%C3%BCleri)
* [Kullanılan Dizayn Patern Mimarisi](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#kullan%C4%B1lan-dizayn-patern-mimarisi)
* [Kullanılan Harici Kütüphaneler](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#kullan%C4%B1lan-harici-k%C3%BCt%C3%BCphaneler)
* [Sayfa Tasarım Haritası](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#sayfa-tasar%C4%B1m-haritas%C4%B1)
* [Kullanılan Bileşenler](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#kullan%C4%B1lan-bile%C5%9Fenler)
* [Kullanılan Yapılar](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#kullan%C4%B1lan-yap%C4%B1lar)
* [Network Endpoints](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#network-endpoints)
* [Unit Test Durumu (En Çok Acemilik Çektiğim Yer)](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk#unit-test-durumu-en-%C3%A7ok-acemilik-%C3%A7ekti%C4%9Fim-yer)
* [Trello Agile-Scrum](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk/blob/main/README.md#trello-scrum-agile)
* [Ödev Sonu Scrum Değerlendirmesi](https://github.com/Vakifbank-IOS-Swift-Patika-Bootcamp/final-project-ozturkomerfaruk/blob/main/README.md#%C3%B6dev-sonu-scrum-de%C4%9Ferlendirmesi)

## Bitirme Projesi NeworlD uygulama ikonu

<img width="350" alt="image" src="https://user-images.githubusercontent.com/56068905/208308847-4b4ad711-59f1-4430-bd85-df2ad1145c89.png">

## Bitirme Projesi Hazırlık Dökümanı

|Sorular|Cevaplar|
|---|---|
|Projenin içeriği ne olacak?|Oyunların listeleneceği bir sayfa. Bu sayfa içerisinde filtrelemelerin de mümkün olduğu ve oyun aramasının da yapılacabileceği bir sayfa olacaktır. Oyunların detay ekranları olacak ve detay ekranından oyunlar favorilere eklenebilecektir. Favoriler içerisinde de küçük bir ayrıntı sayfası olmaktadır. Daha sonra, oyunların bir de not ekleme sayfası olacaktır. Oyunlara yönelik notlar eklenebilecek ve düzenlenip silinebilecektir.|
|Hazırlayacağın proje hangi amaca hizmet edecek?| Ben de bir oyun sever olarak, oyun sever insanların aktif bir şekilde kullanabileceği bir proje yapmayı hedeflemekteyim.|
|Projeni yaparken nereden başlayacaksın ve hangi aşamaları takip edeceksin? Bu konu senin için net mi?|Proje içerisinde kullanılacak harici kütüphanelerin kullanılmasını araştırdım. Trello üzerinde bir görev aşaması belirledim ve ona uymaya çalışacağım.|
|Projende kullanacağın yaklaşımlar neler olacak?|Projeyi tek kişi yöneteceği için, her bir adımın kontrolü bende olacaktır. Projeye tam manasıyla dahil olabilmek için bir dökümantasyon oluşturarak ilerlemeyi hedeflemekteyim. Ayrıca proje içerisinde kullanılacak kütüphanelerin, bir demo uygulamada kullanılıp, test edilip öyle projeye entegre etmek istiyorum.|
|Projeni yazarken hangi teknolojileri kullanacaksın? Bootcamp’te öğrendiğin teknolojiler dışında başka teknolojilere ihtiyacın olacak mı?|En başta Local Notification ve Localization kavramlarını daha önce kullanmadım Swift dünyasında. Ardından kendim Lottie kavramını kullanmak istiyorum. Bir de Test yaklaşımlarını daha önce hiç kullanmadım Swift dünyasında Unit Test yazmak da benim için ilk tecrübe olacak.|
|Projeyi nasıl tasarlayacaksın?|Örnek projeleri inceleyeceğim. Başta Steam olmak üzere bir çok oyun içeriği sunan örnek projelere bakarak, onlardan daha iyi neler yapabilirim, araştıracağım.|

## Proje Gereksinimler Hakkında

|Gereksinimler|Sürümler|
|---|---|
|Xcode|Version 14.2 (14C18)|
|Swift|5.7.2|
|iOS|16.1|

## Ekran Görüntüleri

|Sayfa Görüntüleri|Sayfa Hakkında|
|---|---|
|![1](https://user-images.githubusercontent.com/56068905/208310529-601e24d2-8d34-4e5a-bef3-945fcda55159.gif)|Launch Ekranı ve Onboarding Ekranı|
|![2](https://user-images.githubusercontent.com/56068905/208310540-919102cd-6f4b-469d-b791-3899997c7ca2.gif)|Oyun listeleme ekranı ve listede filtreleme özelliği|
|![3](https://user-images.githubusercontent.com/56068905/208310698-084e041c-67e7-42fc-bf33-c73949bde06d.gif)|Oyun listesinde arama özelliği|
|![detay](https://user-images.githubusercontent.com/56068905/208311332-1ccebc40-0c48-4fef-8af9-d682c3cfd09c.gif)|Oyun detay ekranı|
|![favori](https://user-images.githubusercontent.com/56068905/208311337-bf9f4957-fa4a-4ed3-9227-512ab6d66520.gif)|Favoriler ekranı|
|![6](https://user-images.githubusercontent.com/56068905/208310895-19a4d902-6c50-4434-b452-39130f0157ed.gif)|Notlar listesi, not silme, not ekleme ve güncelleme sayfası|
|![7](https://user-images.githubusercontent.com/56068905/208310905-d1e6963d-5b0d-4d4c-ab61-8610871a0f7c.gif)|Local notification özelliği|
|![ezgif com-gif-maker](https://user-images.githubusercontent.com/56068905/208310951-fe5f5747-fab5-4b52-952b-b0282a64730d.gif)|Türkçe ve İngilizce Localization özelliği|

## Kullanılan Dizayn Patern Mimarisi

**Protocol Oriented MVVM**

## Kullanılan Harici Kütüphaneler

* Alamofire
* iCarousel
* MaterialActivityIndicator
* SwiftAlertView ~> 2.2.1
* lottie-ios

## Sayfa Tasarım Haritası

<img width="532" alt="image" src="https://user-images.githubusercontent.com/56068905/208312797-f8df5308-9394-4ea3-8ccd-97c4a60306b5.png">

## Kullanılan Bileşenler

* UILabel
* UICollectionView
* UIPageControl
* UIView
* UIImageView
* UITableView
* UIButton
* UITextField
* UITextView
* UIScrollView

## Kullanılan Yapılar

* UserDefaults
* CoreData

## Network Endpoints

|URL|Manası|
|---|---|
|/games?key=##API_KEY##&page={page}&page_size={pageSize}|Sayfa numarası ve sayfa saysında gösterilecek oyun sayısı|
|/games/{gameID}?key=##API_KEY##|Oyun ID si ile birlikte oyun detay sayfası|
|/games?key=##API_KEY##&page={page}&page_size={pageSize}&ordering=-released|Yayım tarihine göre en yeni oyunlar|
|/games?key=##API_KEY##&page={page}&page_size={pageSize}&ordering=released|Yayım tarihine göre en eski oyunlar|
|/games?key=##API_KEY##&page={page}&page_size={pageSize}&ordering=-rating|Değerlendirmeye göre en yüksek oyunlar|
|/games?key=##API_KEY##&page={page}&page_size={pageSize}&ordering=rating|Değerlendirmeye göre en eski oyunlar|
|/games?key=##API_KEY##&page={page}&page_size={pageSize}&ordering=added|Favoriye göre listelenen oyunlar|
|/games?key=##API_KEY##&search={searchString}| Girilen oyun adına göre arama yapma|

## Unit Test Durumu (En Çok Acemilik Çektiğim Yer)

<img width="600" alt="image" src="https://user-images.githubusercontent.com/56068905/208317608-61943e62-3f20-467a-9420-1a2029bc5654.png">

## Trello Scrum-Agile

Backlog - To Do - Doing - Done formatında projeyi yürütmeye çalıştım. İçimde kalan 2 eksik kısım bulunmakta. Biri sonsuz tableview içeriği yani Pagination diğeri de MVVM Mock test uygulanması. Ancak Unit testlerim hazır sadece canlıda çalışmaktadırlar.

<img width="500" alt="image" src="https://user-images.githubusercontent.com/56068905/208318106-3e2b5483-5437-4c49-bf3d-d183de4d4e8a.png">

<img width="500" alt="image" src="https://user-images.githubusercontent.com/56068905/208318135-4cf79a18-b8de-4a96-b0fd-410fdcc953ef.png">

<img width="500" alt="image" src="https://user-images.githubusercontent.com/56068905/208318141-64111b3c-bc81-40e8-a331-038d8d0d487d.png">


Agile-Scrum metodolojisinde projeyi yönetmeye çalıştığım, Trello uygulamasında hazırladığım yol haritasını görüntülemek için [tıklayabilirsiniz](https://trello.com/invite/b/ks1phjdB/ATTI5093c6e9e92d387f878ac715a4fe56373521F70F/neworld).

# Ödev Sonu Scrum Değerlendirmesi

Projeyi Eduflow'a teslim ettim ve kendim için bir değerlendirme yaptım. Bu değerlendirmeyi paylaşmak istiyorum.

|Sorular|Cevaplar|
|---|---|
|Neler öğrendin bu süreçte?|Bitirme projesi kapsamında aslında öğrenmediğim şey yok. Kelimenin tek manasıyla bu. Ben bootcamp öncesinde çok az bilgiye sahiptim. Hatta öyle ki, hayatım boyunca hiç iphone kullanmadım. Geçmişte yaşadığım bazı iş tecrübeleri sayesinde iOS developer olmaya karar verdim ve para biriktirerek, biraz borçla Macbook sahibi oldum daha geçtiğimiz Eylül ayında. Dolayısıyla sadece Swift UIKit tecrübesinden ziyade, ben MAC/iPhone ikilisine yeni adepte olmaya çalışan birisiyim. Bu bootcamp bu sürecimi çok hızlandırdı ve ortaya çok keyif alarak yaptığım bu projeyi ortaya çıkarttı. En başından en sonuna, bu 2 haftalık süreçte her gün 7-8 saat **minimum sürede** geçirdim. Tüm odağım bu ödev oldu ve elimden gelen tüm çabayı göstermek istedim. Bootcamp boyunca bilmediğim, öğrenmediğim ne varsa internetten araştırarak geçti bu süreç ve bundan çok keyif aldım.|
|Aynı süre verilse neyi iyi yapardın?|Aynı süre şuanki aklımda yeniden verilse bana, tasarıma çok zaman kaybetmezdim. Tasarım konusunda çok az bilgim vardı ve bana çok zaman kaybettirdi. Hele ScrollView kullanımı tam felaketti benim için. Ancak günün sonunda mantıklarını oturttuğuma inanıyorum. MVVM mimarisini daha sade yazmayı çok isterdim ama maalesef buna gerçek manada çalışma tecrübesi lazım. Soru sorabileceğim, kod inceleyebileceğim en ufak bir şey yok. İnternette kaynakların hepsi ya çok profosyonel ya da çok basit düzeyde. Arasını yakalayamadım maalesef. Aynı şekilde Test kullanımını da söyleyebilirim. Unit Test de çok fazla içerik gördüm ama tam manasıyla istediğim sonuçları elde edemedim. Yine de elimden geldiğince test etmeye çalıştım. Bu süreçleri daha iyi yönetebilirdim belki ama yine de bir tecrübe şart bu konuda.|


Evet iki soru ve iki cevap. Ben bu süreçten dediğim gibi çok keyif aldım. Bu bootcampt'de olmaktan dolayı çok mutlu oldum. Çok şey öğrendiğime inanıyor ve hayatım boyunca unutmayacağım bir eğitim sürecinde olduğumu düşünüyorum. Bana bu imkanı sağlayan Patika.dev ekibine tekrardan çok teşekkür ederim. Bizlere en iyi şekilde öğretmenlik yapan, harika bir insan olan, Kaan Yıldırım hocama tekrardan çok teşekkür ederim. Bizleri Vakıfbank çatısı altında toplayan Vakıfbank'a çok teşekkür ederim ve son olarak, bootcampte yer alan bütün arkadaşlara çok teşekkür ederim. Bazen onlara sorular sordum bazen onlar sorular sordu birlikte cevaplar aradık. Bu süreçte tanıştığım arkadaşlıkların uzun ömürlü olmasını çok isterim.

Teşekkürler

Ömer Faruk Öztürk
