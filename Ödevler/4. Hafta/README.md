# 4. Hafta Ödevi

<img width="260" alt="204097838-b52ece5d-f2b4-4637-93ae-ae3e08404ddd-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204100123-0155e105-8e80-411f-ae0f-8d1162b5737c.png">


## Ödev Tanımı

3 tablı bir uygulamadır. 1. tabında 3 adet sayfa bulunmaktadır. 1. sayfasında karakterler listelenmektedir. Bir karakterin gerçek ismi, dizi de ismi ve takma adı listelenmektedir. Aynı zamanda karakterlerin dizide ki isimlerine göre arama da yapılabilmektedir. Bir karaktere tıklanıldığı zaman, o karaktere ait detay bilgilerinin gözükebileceği bir detay sayfası bulunmaktadır. Bu detay sayfasında karakterin; gerçek ismi, takma adı, dizide ki adı, gözüktüğü sezonlar ve son olarak, dizide ki meslekleri yer almaktadır. Sayfanın en yukarısında, karaktere ait alıntırıların olduğu 3. sayfaya gitmenin butonu yer almaktadır. Bu butona tıklanıldığında, eğer varsa o karaktere ait tüm alıntılar listelenmektedir. Eğer yoksa sayfadan geri yönlendirilmektedir.
      
Uygulamanın ikinci tabında Breaking Bad serisinin ve Better Call Saul dizilerinin bölümleri yer almaktadır. Bu bölümler, sezonlara göre listelenmektedir. Her bir tablonun hücresinde bölümün başlığı ve tarihi de yer almaktadır. Eğer bir bölüme tıklanılırsa, o bölümde yer alan oyuncuların listelendiği bir popup ekranı açılmaktadır.
      
Uygulamnın son tabında ise Breaking Bad dizisine ait bir WebView yer almaktadır. Bu WebView de IMDB sayfası gözükmektedir. Ancak uygulama içerisinde Better Call Saul dizisinin de bölümleri ve oyuncuları listelendiği için sağ üst butondan Better Call Saul dizisinin IMDB sayfasına gidilebilmektedir. Sol üst tarafta ise, benim blog sayfama gidilen bir buton yer almaktadır. Yazar imzası olması için eklediğim küçük bir buton.

https://user-images.githubusercontent.com/56068905/204097652-e10826f3-e277-465b-98b2-4edd6f900889.mov

### Network

[Breaking Bad Api](https://breakingbadapi.com/) sitesinden 4 adet EndPoint kullanılmıştır.

* **/characters** - Karakterleri getirme
* **/quote?author=\(author)** - Yazara göre alıntıları getirme
* **/episodes** - Bölümleri getirme
* **/characters?name=\(name)** - Dizide ki isme göre karakterleri harf harf getirmesi
       
### Dizayn Patern Mimarisi

* MVC

### 3. Parti Kütüphaneler

* MaterialActivityIndicator
* SwiftAlertView
       
## Sayfa Tasarımları ve Önemli Parçaları

<img width="175" alt="Screenshot_2022-11-26_at_19 26 34-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204099006-5faab988-59ca-4590-8656-c27b0897a03e.png"> <img width="175" alt="Screenshot_2022-11-26_at_19 27 29-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204099010-255ce1b3-66f7-41ad-80d9-fa1112227f52.png"> <img width="173" alt="Screenshot_2022-11-26_at_19 28 47-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204099013-1d4928eb-3505-439f-a3fd-e7ec52596a4e.png"> <img width="180" alt="Screenshot_2022-11-26_at_19 29 01-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204099019-92032e4d-9b03-4ac6-8822-0edb1bf1cb89.png">

* Collection View
* Search Bar
* Custom Collection View Cell
* Collection View Flow Layout
* Table View
* UIImageView

<img width="175" alt="Screenshot_2022-11-26_at_19 40 06-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204099440-2d439182-b38f-4076-b3df-d0af6144bf42.png"> <img width="182" alt="Screenshot_2022-11-26_at_19 40 53-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204099443-acc73111-f102-4206-92af-9188eb6f0aa4.png">

* Table View with Section
* XibFile (Popup View)
* Delegate Pattern with XibFile
* Extension String to Change Date Format
* Table View in View

<img width="176" alt="Screenshot_2022-11-26_at_19 49 12-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204099855-b14b783d-910c-4506-be55-3ae7e7e1b396.png"> <img width="183" alt="Screenshot_2022-11-26_at_19 49 28-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204099859-2ceb614f-86c7-4cc4-b465-62fcd30adda2.png"> <img width="179" alt="Screenshot_2022-11-26_at_19 49 47-removebg-preview" src="https://user-images.githubusercontent.com/56068905/204099862-52edd791-9342-48a9-a73a-19ec41bf5c18.png">

* WebView 




