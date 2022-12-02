# 5. Hafta

**4. hafta** ödevine ek olarak geliştirilen bu proje kapsamında, The Breaking Bad dizisine ek olarak, her bir bölüme özel olarak not ekleme, çıkarma ve güncelleme işlemleri eklenmiştir. Bu notların listeleneceği bir tab sekmesi eklenmiştir. Sağ alt köşeye bir Floating Button eklenmiştir. Bu eklenme ile, listeye ekleme yapılabilmektedir.

Ayrıca listede herhangi bir bölüme tıklama gerçekleştiğinde, o bölüm hakkında yazılan notlar hakkında detay sayfası açılmaktadır.

Proje kapsamında, CoreData üzerinde temel CRUD işlemleri gerçekleşmiştir. Bu kapsamda gerçekleştirilen projenin ekran videosu şu şekildedir:

https://user-images.githubusercontent.com/56068905/205379514-bf97ac4e-f5c5-4f76-9f95-a8996cab891f.mov

## Listeme Sayfası

<img width="200" src= "https://user-images.githubusercontent.com/56068905/205374367-7429b33b-0bb6-45b7-88a8-44b942603719.png" />

* Programatik olarak Floating Button
* Table View with Custom Cell

## Ekleme / Güncelleme Sayfası

<img width="200" src= "https://user-images.githubusercontent.com/56068905/205374679-8ea9cc32-ca03-4ec0-a09a-11b3bbb66d7c.png" />

Eğer listeden giriş yapılırsa *Güncelleme Sayfası, eğer kaydet butonu ile oluşturulursa *Kaydet Sayfası olmaktadır.

* Listeme Sayfası ile Delegate Pattern ile iletişim kurması
* Animasyonlu Button Collection kullanımı
* TextView kullanımı
* ImageView kullanımı
* ImagePicker kullanımı (Galeriden ya da Kameradan Fotoğraf Getirme)

## Bölüm Seçme Ekranı

<img width="200" src= "https://user-images.githubusercontent.com/56068905/205376526-1fa1797e-89d8-47f2-87d0-4889d075dc3c.png" />

Bir Pop Up olarak açılmaktadır. Amacı bölümü seçip, not ekleme / güncelleme sayfasında kullanılmasını sağlamaktadır. Bu sebeple delegate pattern olacak şekilde kullanılmıştır.

## CoreData Kullanımı

<img width="500" alt="image" src="https://user-images.githubusercontent.com/56068905/205377149-afe152d2-1153-4796-affe-44291c8c4ab2.png">

Image olarak CoreData'ya CRUD işlemleri de eklenmiştir. Yani: Create, Read, Update, Delete
