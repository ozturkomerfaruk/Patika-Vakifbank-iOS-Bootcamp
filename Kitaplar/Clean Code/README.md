# Clean Code - A handbook of Agile Software Craftsmanship

## Chapter 1 - Clean Code

Profosyonel bir yazılımcı çok sağlam algoritmalar yazan birisi değildir. Profosyonel bir yazılımcı temiz kod yazabilendir. Bu kitap boyunca odağımız daha çok bu temelde olacak.

İnternette çok popüler bir söz bulunmaktadır.

***Bu kitabı iki sebepten ötürü okuyorsunuz: ilki yazılımcısınız, ikincisi daha iyi bir yazılımcı olmak istiyorsunuz. Güzel, çünkü daha iyi yazılımcılara ihtiyacımız var.***

Bu söze belki her mecrada denk gelmişimdir. İşte şimdi kaynağının ne olduğunu görüyorum. Kitap, bu sözün altını dolu dolu kod örnekleriyle beraber açıklıyor. Kitap açık açık önsöz kısmında çok fazla çalışmamız ve başarızlığı tatmaız gerektiğini vurgulayuyor. Bu aslında nitekim doğru bir şey. Eğer bir şirkette gerçek manada Clean Code'un ne demek olduğunu anlamamışsanız, bu kitabı hiçbir zaman büyük bir ilgiyle okumayacaksınız anlamına geliyor.

Bir şirkette çalışırken eğer orada Clena Code prensipleri göz edilmezse burada bazı sıkıntılar çıkacaktır. Mesela verimlilik düşmesi gibi. Şirket yöneticileri, tabi koddan da zerre kadar anlamadıkları için, verimliliği artırmak için ne yapmak istiyorlar, doğruca insan sayısını artırmayı planlıyorlar. Yahu be patroncum sorunun çözümü orada insan sayısını artırmak mıdır, gerçekten. Sonra verimlilik düşüyor, çalışanlar mutsuz oluyor. Ortada disiplin yok, kural yok. EEEE? eesi yok sonunda uygulama çökmeye mecbur kalıyor. Beni bi salın der gibi uygulama kendini kapatıyor resmen. Yazılımcı da masum niye çalışmıyo bu diyor. Gerçi clean code'a uymayan yazılımcı masum olabilir mi?

Peki koda ne olduda çökmeye başladı? Son teslim tarihi (deadline) mı sıkışık, Gereksinimler (Requirements) mi çok değişiyor. Hayır abi, kod çökmesinin tek sebebi vardır kodu yazanların profosyonel olmaması.

Peki şirket yöneticileri, neden bu kadar vurdumduymaz mı diyorsuuz? Demeyin, çünkü kodu yazan bizler profosyonel değiliz. Profosyonel kişi, doğruları çatır çatır yöneticiye söyler. Yok kovulurum yok bir şey olacak ayy amaaan demez. Bakın bunları gerçekten kitaptan bağımsız yazıyorum çünkü gerçekten bu tamamen özgüvensel bir harekettir. Yönetici bariz bir şekilde bir şeyler geveliyor ve bizde gerçek manada o sürede temiz kod yazamayacağız dersek işte orada her şey sarpa sarıyor. 

The Primal Conundrum

Temiz kod nedir, peki? 

Bjarne Stroustrup'ın yani C++ mucidinin bir alıntısı bulunmaktadır. ***Kodumun zarif ve verimli olmasını seviyorum. Hataların saklanmasını zorlaştırmak için mantık açık, bakımı kolaylaştırmak için bağımlılıklar minimum düzeyde, hata işleme açık bir stratejiye göre eksiksiz ve insanları kodu ilkesiz bir şekilde karmaşık hale getirmeye teşvik etmemek için optimuma yakın performans olmalıdır. - söz verilen optimizasyonlar. Temiz kod bir şeyi iyi yapar.***

Grady Booch'ın yani OOP'ın mimarlarından olan bir yazılımcının bir alıntısı bulunmaktadır. ***Temiz kod basit ve doğrudandır. Temiz kod, iyi yazılmış nesir gibi okunur. Temiz kod, tasarımcının niyetini asla gizlemez, bunun yerine kesin soyutlamalar ve basit kontrol hatlarıyla doludur.***

Dave Thomas'ın yani OTI'nin kurucusunun bir alıntısı bulunmaktadır. ***Temiz kod, orijinal yazarı dışında bir geliştirici tarafından okunabilir ve geliştirilebilir. Birim ve kabul testleri vardır. Anlamlı isimleri var. Bir şeyi yapmak için birçok yol yerine tek bir yol sağlar. Açıkça tanımlanan minimum bağımlılıklara sahiptir ve açık ve minimal bir API sağlar. Dile bağlı olarak, gerekli tüm bilgiler tek başına kodda açıkça ifade edilemeyeceğinden, kod okuryazar olmalıdır.***

Micheal Feathers'ın bir alıntısı bulunmaktadır. ***Temiz kodda fark ettiğim tüm nitelikleri listeleyebilirim, ancak hepsine yol açan kapsayıcı bir kalite var. Temiz kod her zaman umursayan biri tarafından yazılmış gibi görünür. Daha iyi hale getirmek için yapabileceğiniz bariz hiçbir şey yok. Tüm bunlar kodun yazarı tarafından düşünüldü ve iyileştirmeleri hayal etmeye çalışırsanız, bulunduğunuz yere geri götürülürsünüz, birisinin size bıraktığı kodu takdir edersiniz - derinden ilgilenen biri tarafından bırakılan kod. zanaat hakkında.***

Bu sektörde büyük duayenlerden, bu tip o kadar çok fazla alıntı bulunuyor ki... Temiz kod yazmak bir çok açıdan insana fayda getirmektedir. Bu kaçınılmaz bir gerçektir. Peki, sonuç olarak bu kazanımdan bizim kazanacağımız sonuçlar nelerdir? Adım adım bakalım.

## Chapter 2 - Meaningful Names

İsimlendirme yazılımın her anında bulunmaktadır. Bir değişken isminden bir sınıf ismine kadar hayatın her anlamında bulunmaktadır. Öyleyse bunu nasıl daha iyi yapabiliriz?

```int d``` diye bir değişken var diyelim. Bu ne demek? Neyi temsil ediyor, neyi simgeliyor? Hiçbir şey belli değil. İsimlendirme de koddan fedakarlık yapılarak harflerden kaçmak saçmalıktır. Bu cümleyi kitabı baz alarak açıklamıyorum aslında. Sadece şöyle bir örnek verebilirim. Şirkette bir projede çalışıyorsunuz diyelim ve bir tane zeka küpü eleman 5 sene öncesinde yazdığı bir algoritmada saçma sapan değişken tanımlamaları yapmış. O eleman da işten ayrılmış gitmiş sen ne yaptın diye soramıyorsunuz diyelim. Ya da ayrılmasın adam 5 sene öncesinin yaptığını nasıl hatırlasın değil mi? 😅 Ama değişkenleri güzel bir şekilde tanımlasa, sınıf adları, fonksiyon adları vs. güzel bir şekilde ne kaybederdi? Zamanı mı gitti sonuna kadar değerdi.

Mesela?

```
public List<int[]> getThem() {
    List<int[]> list1 = new ArrayList<int[]>();
    for (int[] x : theList)
        if (x[0] == 4)
            list1.add(x);
    return list1;
}
```

Üstadım burada:
1. theList nedir
2. theList'in ilk elemanının önemi ne?
3. 4 değeri nedir orada?
4. dönen list1 ne için kullanılacak, ne döndürüyor orada? 

Böyle her yazılan koda tek tek bakılarak gidilirse binlerce satır kod bulunduran algoritmanın vay haline gerçekten

```
public List<int[]> getFlaggedCells() {
    List<int[]> flaggedCells = new ArrayList<int[]>();
    for (int[] cell : gameBoard)
        if (cell[STATUS_VALUE] == FLAGGED)
            flaggedCells.add(cell);
    return flaggedCells;
}
```

Ya Allah aşkına şu kadarını yazmak sana ne kaybettirir? Ama okuyana çok şey kazandırır. Bunu acı bir şekilde tecrübe etmiş biri olarak bu satırları yazdığım için kendime hakim olamıyorum 🥸

Diğer bir karmaşıklıkta, küçük l harfidir. büyük I harfine benzemektedir. İkisini yanyana yazınca zaten farkediyorsunuz. Yada O harfi ile 0 rakamı arasında ki benzerliktir. Bu benzerlikler genelde göz ardı ediliyor ancak mesela bir for döngüsünde bu karakterler tek başına kullanıldığında çok acı verici olabiliyor. Ha ben hiç denk gelmedim ama siz siz olun yine de kaçının.

Bazen de diğer bir karmaşa, hızlıca parametre girilirken felan a1, a2, a3 gibi isimlendirmeler yaparız. Ama yapmayın siz. Bu yanlış. Kod daha sonra okunurken aylar sonra, bu a1 a2 ne diyoruz.

Diğer bir karmaşa da, genel de kod kültürü olmayan şirketlerde ya da startup evresindeki şirketlerde ki yazılımcıların pek çok kullandığı bir karmaşadır. Bu karmaşa da kelime anlamları birbirine karışır. Mesela

Info ve Data kelimeleri benzerdir. ProductData ile ProductInfo adı altında iki sınıf varsa, bu info ve data birbirine karışır ve bu karmaşıklık insanı yorar. Nasıl yorar, aylar sonra koda baktığında anlamlar birbirine karışır. Şuan sen koda bakarken her şeye hakim olabilirsin üstadım ama 1 sene sonra o koda baktığında kod seni alnından öper.

Onun yerine:

* getActiveAccount();
* getActiveAccounts();
* getActiveAccountInfo();

Genelde değişken isimleri konulurken, İngilizce isimler kullanılır. Her şirketin kültürü haline gelmiştir bu hemen hemen. Orada da İngilizceyi adam akıllı bilen çok fazla insan bilen yoktur. Tekrar ediyorum adam akıllı... Bu yüzden dolayı değişken isimleri konulurken yaygın kullanılan isimler kullanılmalıdır. Mesela adequate de yeterli anlamına gelmektedir ama bu kelimeyi adam akıllı kaç insan biliyor ki, üstadım? Onun yerine enough koy geç. Ya da impeaccable kelimesi yerine perfect de geç kasmaya ne gerek var. Tamam en İngiliz sen olabilirsin ama geneli düşünmek zorundasın.

Bir de verilen isimler genelde aratılabilir isimler olmalıdır. Mesela tek harfli değişkenleri hiç kullanmayacak mısın kullanacaksın tabiki de. Örneğin for loop açtın çak geç baba i'yi j'yi ama gidip de önemli bir sabit sayı değişkenine n deyip geçme yaz ona MAX_CLASSES_PER_STUDENT, o zaman ctrl + shift + f felan yaptığında görünür her yerden.

Birde Swiftdeki Protocol olayı var mesela diğer dillerde Implementation ya da Interfaces olayıç Yaygın kullanımda IShapeFactory, ShapeFactory kullanılıyor ama gerek yok ShapeFactoryImpl demek daha kullanışlı. I harfi bazen dikkat dağıtabiliyor. Zaten Apple'da Swift Guide'da Protocol oluşturacaksan sonuna protocol yaz diyor mesela. 

Sınıf isimleri asla fiil olmamalıdır. Her zaman isim tamlaması olmalıdır. WikiPage, AddressParser gibi.

Metot isimleri fiillerden oluşmalıdır. deletePage(), save() gibi. Birde get set olayları var. fiilerinbaşlarınagelmelidir. isEmpty(), getName() vs.

Farklı parametrelere sahip constructor'lar kurmak yerine Static kullanmak daha doğrudur. Örneğin: İlki çok daha etkilidir.

```
Complex fulcrumPoint = Complex.FromRealNumber(23.0);
Complex fulcrumPoint = new Complex(23.0);
```

Bu isimlendirme olayını gerçekten hafife almamak gerekmektedir. Bir projeye dahil olduysanız, o projede kod geliştirmek istiyorsanız, o projeye sırf saygı duymanızdan isimlendirmelere dikkat etmelisiniz. Eğer o projede bir de code reviewer bulunmuyorsa Allaaah yani. Tamamen saygınızdan bunu yapmalısınız. Bir büyük metodun içerisinde örneğin parçalara ayırarak, isimlendirmeleri güzel vermeye çalışmanız sadece sizin iyi bir Clean Code'a bakış açınızı göstermez hem de iyi bir grup üyesi olduğunuz anlamına gelir. Başka birisi projeye bakar bakmaz onun ne olduğunu hızlıca anlamış olur.

## Chapter 3 - Functions

Fonksiyonların önemli, futbolda ki futbol topu kadar önemlidir. Ne demek istiyorum 😂 Çok basit. Futbol topu futbol için ne ise, fonksiyonlarda bu demektir. Fonksiyon ne kadar uzunsa, içinde duplicate kodlar ne kadar fazlaysa, saçma sapan değişken isimlendirmeleri ne kadar fazlaysa bir futbol topunun ağırlığı o kadar artmaktadır ve günün sonunda oynayabiliyorsanız 100 kilo bir futbol topuyla gol atmaya çalışın. ATAMAZSINIZ. Bakın olay gerçekten bu kadar basit.

Fonksiyonların iki kuralı vardır.

1. Küçük ve kısa olmaları gerektiğidir.
2. Daha da kısa olmaları gerektiğidir.

Kitapta geçen ilginç bir olay var. 80'lerde fonskyion bilgisayar ekranından büyük olmaması gerektiği söyleniyormuş. Şaka gibi 🫠 Ancak o zamanın şartlarına baktığında bir ekrana en fazla 24 satır sığıyormuş. Ve genişlik olarak 80 karakter geliyormuş. Fonksiyon nasılda küçülüyor bir anda değil mi 🤓

Tabi günümüzde 32 inç monitörlerle vs. kod yazan insanlar var. Bunu sizlere söylemiyoruz haa sakın yanlış anlamayın. ahahahaha.

Fonksiyonlar sadece bir şey yapmalı. İki şeye izin vermemeli. Tek bir görevi olmalı.

Olaya gel:

**Eğer bir fonksiyon sadece isminde belirtilen adımları yapıyorsa, o fonksiyon bir şey yapıyordur.**

İşte bu!!

Günlük hayatta birçok yerde kullanmayı tercih ettğim Switch ifadelerini kitap büyük bir şekilde engel koyuyor. Bakınız şimdi şu koda:

```
public Money calculatePay(Employee e) throws InvalidEmployeeType {
    switch (e.type) {
        case COMMISSIONED:
            return calculateCommissionedPay(e);
        case HOURLY:
            return calculateHourlyPay(e);
        case SALARIED:
            return calculateSalariedPay(e);
        default:
            throw new InvalidEmployeeType(e.type);
    }
}
```

Burada bazı sorunlar bulunmakta

1. Çok büyük ve Employee tipleri eklendikçe de büyümeye devam edecek.
2. Kesinlikle birden fazla şey yapıyor.
3. Tek Sorumluluk Kuralı’nı (SRP — Single Responsibility Rule) ihlal ediyor.
4. Açık/Kapalı Prensibi’ni (OCP — Open/Closed Principle) de ihlal ediyor.

İşte burada Abstract, Implementation vs. olayına başvurmalısın dostum (kendime not)

```
public abstract class Employee {
    public abstract boolean isPayday();
    public abstract Money calculatePay();
    public abstract void deliverPay(Money pay);
}
-----------------------------------------------------------------
public interface EmployeeFactory {
    public Employee makeEmployee(EmployeeRecord r) throws InvalidEmployeeType;
}
------------------------------------------------------------------
public class EmployeeFactoryImpl implements EmployeeFactory {
    public Employee makeEmployee(EmployeeRecord r) throws InvalidEmployeeType {
        switch (r.type) {
            case COMMISSIONED:
                return new CommissionedEmployee(r);
            case HOURLY:
                return new HourlyEmployee(r);
            case SALARIED:
                return new SalariedEmploye(r);
            default:
                throw new InvalidEmployeeType(r.type);
        }
    }
}
```

EmployeeFactoryImpl, Employee türevlerinin uygun örneklerini (instances) oluşturmak için switch ifadesini kullanacak ve calculatePay, isPayday ve deliverPay gibi çeşitli fonksiyonlar, Employee arayüzünden polimorfik olarak gönderilecektir.

Switch şöyle tolere edilir:

* Yalnızca bir kez görüneceklerse
* Sistemin geri kalanının göremeyeceği şekilde bir arayüz ilişkisi arkasına gizleneceklerse
* Polimorfik nesneleri yaratmak için kullanılacaklarsa

Bir değer meselede parametre meselesidir. İdeal programda parametre sayısı sıfır olmalıdır. Parametreleri test etmek de zordur. Hiç parametre yoksa test kolay. Bir tane varsa eh, iki tane varsa ıh mıh fazlası bünyeye zarar. Acı yemek gibi. Gerek yok abi.

Boolean parametreleri pek kullanmayın. Fonksiyonların amacı tek olmalıydı. True ya da false olarak döndürterek zaten iki amaç sokuyoruz.

Eğer parametre ikiden fazlaysa onları sınıf şeklinde verditmeye çalışın. Örneğin parametre olarak a ve b yükseklğini ayrı ayrı vermek yerine dikdörtgen diye sınıf olsun onu verin direk.

Şimdi bir de, zararsız gibi gözüken ama yan etkileri olan metotlar vardır. Mesela siz bir şey yapmak isterken bir bakmışsınız hop başka şey olmuş. Örneğin:

```
public class UserValidator {
    private Cryptographer cryptographer;

    public boolean checkPassword(String userName, String password) {
        User user = UserGateway.findByName(userName);
        if (user != User.NULL) {
            String codedPhrase = user.getPhraseEncodedByPassword();
            String phrase = cryptographer.decrypt(codedPhrase, password);
            if ("Valid Password".equals(phrase)) {
                Session.initialize();
                return true;
            }
        }
        return false;
    }
}
```

Bu fonksiyon bir userName’i bir password’e eşlemek için standart bir algoritma kullanıyor. Eşleşirse true, eşleşmezse false dönüyor. Ancak bir yan etkisi var, o da Session.initialize() çağrısıdır. checkPassword, isminde söylendiği gibi şifreyi kontrol eder. Ancak Session’ın initialize edileceğini söylemiyor. Bu nedenle bu fonksiyonu çağıran, mevcut oturum verisini silme riski taşıyor.

Fonksiyonlar ya bir şeyler yaparlar ya da bir şeylere cevap verirler; ancak ikisini birden yapmazlar. Ya bir nesnenin yapısını değiştirirler ya da o nesne hakkında bilgi dönerler.

En önemli kısımlardan birisi de try/catch ifadeleridir. Alışkanlık olmalıdır. Ancak try/catch blokları doğaları gereği çirkindir. Normal işleyişi ve kodun yapısını karıştırır. Bu nedenle try ve catch bloklarının gövdelerini kendi fonksiyonlarına ayırmak daha iyidir.

Fonksiyonlar bir şeyi yapmalıdır, hata işleme ise başlı başına bir şeydir. Bu yüzden hataları işleyen bir metot başka bir şey yapmamalıdır. Try Catchleri bu şekilde ayırın ve bunların tek görevi hata işlemek olsun.

Bir fonksiyonun sadece bir return ifadesi olmalı, bir döngüde break, continue ya da goto ifadeleri asla ve asla olmamalıdır. Fonksiyonlar küçük olduğunda, bu kurallar küçük faydalar sağlar. Sadece büyük metotlarda bu ifadeler büyük faydalar getirir. Yani fonksiyonlarınızı küçük tutarsanız, birden fazla return, continue ya da break ifadesi kodunuza zarar veremez; hatta tek giriş - tek çıkış kuralından (single-entry, single-exit) bile daha açıklayıcı olabilir. Diğer bir taraftan goto ifadesi sadece çok büyük fonksiyonlarda bir anlam ifade eder bu nedenle goto kullanımından kaçınılmalıdır.

Dont Repeat Yourself ilkesi vardır. DRY derler buna hatta kısaca. Fonksiyonların amacı budur en nihayetinde. Fonksiyonların tek bir amacı olmalıdır ve tek amaç ile kod okunabilirliği son derece artmaktadır. Karmaşık ecük bücük kodlar son derece yanlıştır üstadım.

Chapter'ın en sonunda can alıcı soru soruluyor. İyi de hocam peki nasıl yazacağız bunları adam akıllı der gibi bir soru :)

Bir makale hakkında bir şeyler yazdığınızda; önce düşüncelerinizi toplarsınız, daha sonra kulağa iyi gelene kadar düzenleme yaparsınız. İlk taslak acemi ve dağınık olabilir. Ben kod yazıyorken fonksiyonlarımın ilk halleri uzun ve karışık olur. Bir sürü girintilemeler ve iç içe döngüleri olur. Uzun argüman listeleri olur. Verdiğim isimler keyfidir ve tekrarlanmış (duplicate) kodlar vardır. Ancak bu acemi satırların her birini kapsayan testlerim de vardır. Daha sonra kodu fonksiyonlara bölerek, isimleri değiştirerek, tekrarlanmış kodları çıkartarak (extract) rafine ederim. Metotları küçültürüm ve tekrar sıraya koyarım. Sonunda fonksiyonlarım, anlattığım tüm bu kurallara uygun olurlar.

## Chapter 4 - Comments

En öncelikle vurgulanması gereken hususlardan birisi kötü bir kodu açıklamaya çalışarak zaman kaybetmeyin. Ona boşuna yorum yazmayın. O kodu yeniden yazın. Yeniden yazdığınız koda yorum satırı ekleyin.

Çok güzel bir söz var: **Bir yorum ne kadar eski olursa, yazıldığı koddan bir o kadar uzak ve bir o kadar yanlış oluyor. Sebebi basit, yazılımcılar yorumları güncellemezler.**

Bazen de bir projeye dahil olduğumuzda, proje hakkında hiçbir şey bilmesek bile yorum satırlarına bakarak projeyi daha çalıştırmadan anlamaya çalışabiliriz. Ancak hödüğün biri yorum yazmış sonra güncellememiş ve o aylarca kalmış orada. Üstünden çok kod gelmiş gitmiş. O yorum satırları nasıl da yanlış yönlendiriyor insanları değil mi 😒 

Yorum yazmak güzeldir ancak fonksiyonerliği fazla, değişken isimleri son derece de iyi gibi temiz kod nüansında yazılan yorumsuz bir kod, emin olun saçma salak yaılan koddan ve o koda ait onlarca boş açıklama satırından bin kat mevladır.

Normalde ben bu kitabı okumadan önce yorum satırları son derece önemli felan filan derdim ama anlıyorum ki şimdi: **Gerçekten iyi bir yorum, onu yazmamanın bir yolunu bulduğunuz yorumdur.**

Ancak yorum yazmadan olur mu, tabiki hayır. Bazı algoritmalar için gereklidir ancak nesne taban mantığında kod yazmak, çok çok çok iyi algoritma kurmadan daha önce gelmektedir.

Bazı yorum satırlarında da, telif hakkı sebebiyle ve yazarlık durumları için bazı ifadeler kullanılması gerekiliyormuş. Örneğin:

```
// Copyright (C) 2003,2004,2005 by Object Mentor, Inc. All rights reserved.
// Released under the terms of the GNU General Public License version 2 or later.
```

Tabi tüm durumlar için gerekli olan yasal yorumları her yoruma koymaktansa standart bir lisans ya da dış bir döküman referans tercih edilmeli.

Mesela iyi yorum yazmak mı, temiz kod mu sorusuna şöyle bakalım

```
// format matched kk:mm:ss EEE, MMM dd, yyyy
Pattern timeMatcher = Pattern.compile("\\d*:\\d*:\\d* \\w*, \\w* \\d*, \\d*");
```
Yorum yazmak yerine eğer kod, tarihlerin ve zamanların formatını dönüştüren bir sınıfa taşındaydı çok daha açık ve temiz olabilirdi.

Bir diğer önemli yorum satırı da TODO yorumlarıdır. Hemen hemen her dilde olan mükemmel bir özelliktir. Bir işaretleme noktasıdır ve burada fonksiyonun neden bozuk bir gerçekleştirimi olduğunu ve fonksiyonun gelecekte nasıl olması gerektiğini söylemektedir. Dahas sonra eklenmesi gerekenleri ya da deprecated edilmişleri kaldırmak istedikleri yerleri işaretleme yeridir. TODO olduğunda bunlar ayrı bir yerden gözükmektedir.

Birde API açıklamaları var. Burada Javadoc'lardan bahsediyor kitap. Ancak ben kendi yorumumu açıklamak istiyorum. Bir mobil geliştiricinin en çok zorlanacağı ifadelerden biri belki de kötü bir API'dır. Endpoint'den bir veri geliyor ama ne geliyor. Bir projede bir keresinde bir endpoint görmüştüm. Hiç güncellenmemiş ve 10 yıllık bir API idi. Her şey enumlarla tutulmuştu. Böyle nasıl deyim ama her şey. Mesela saatler bile enumlarla tutulmuştu. Eski, kara düzen java desktop uygulaması için hazırlanmış bir API'yı biz mobile çekmeye çalışıyorduk. Her şey saçmalıklardan ibaret çünkü saat tutuyoruz mesela saati string olarak vermek yerine bana sadece enumdan karşılığı dönüyor. Mesela saat 18:30 kaydedilmiş bana bi rakam dönüyor 25 mesela. Ula ben bunu nasıl anlayım, nasıl bilim, kime sorum. Hayattan bezmiştim. Zaten kod yazmayı adam akıllı beceremiyorum tam, bir de böyle bir saçmalık var. Benden ne isteniyor, napıyorum diyorum. İşte bakın burada Clean Code'un tamamen ihmal edilmesi söz konusudur. Burada amaç gerçekten de, API açıklamaları olmalarıdır.

Ama yorumlar öyle gereksiz olmayacak abi, kötü yazılmayacak. O fonksiyonlar gerçekten de tek bir amaca hizmet edecek ve her fonksiyonun da yorum satırları olması gerektiği gibi olacak. Parametresi nedir, ne değildir keskin kurallarla belirtilecek. Ne anlama geldiğini anlamak için diğer modüllere baktırmayı gerektirecek bir hiçbir yorum, yorum yazmak için harcanacak zamana değmez.

Koda baktığında böyle çaaat diye anlayacan direk. Yorum yazmaya gerek duymayacan. Sonra dicen ki, ha bi de yorum yazım. Sonra paat al sana clean code hocam.

Bazı yorum satırları zorunludur. Parametre açıklamaları gibi.

```
/**
 * @param title             The title of the CD
 * @param author            The author of the CD
 * @param tracks            The number of tracks on the CD
 * @param durationInMinutes The duration of the CD in minutes
 */
public void addCD(String title, String author,
                  int tracks, int durationInMinutes) {
    CD cd = new CD();
    cd.title = title;
    cd.author = author;
    cd.tracks = tracks;
    cd.duration = duration;
    cdList.add(cd);
}
```

Günlük gibi yazılan yorumlar

![image](https://user-images.githubusercontent.com/56068905/204452548-a138cfbc-6b2f-435c-a6ed-bcca75dd5b4d.png)

Ancak günümüzde artık Git gibi versiyon kod sistemleri var. Bunlar laf kalabalığı. Ama burda özellikle vurgulamak istediğim bir şey var. Şu yorumların düzenine bakın. İşte zamanında 2000 yılından önce bilgisayarda kod böyle yazılıyordu.

```
private void startSending() {
    try {
        doSending();
    } catch (SocketException e) {
        // normal. someone stopped the request.
    } catch (Exception e) {
        try {
            response.add(ErrorResponder.makeExceptionString(e));
            response.closeAll();
        } catch (Exception e1) {
            //Give me a break!
        }
    }
}
```

Adam yılmış yılmış. Salın beni demiş. Ahahaha. Bende bazen yeteeeer diyordum ve unutuyordum kod kalıyordu öyle 😂 

Ama ne demiştik biz try catch ifadeleri ayrı bir metotta olmalı ve fonksiyonun amacı tek olmalı. eğer öyle olursa yorum yazmak daha anlamlı olur.

```
private void startSending() {
    try {
        doSending();
    } catch (SocketException e) {
        // normal. someone stopped the request.
    } catch (Exception e) {
        addExceptionAndCloseResponse(e);
    }
}

private void addExceptionAndCloseResponse(Exception e) {
    try {
        response.add(ErrorResponder.makeExceptionString(e));
        response.closeAll();
    } catch (Exception e1) {
    }
}
```

Yani yorum yazacaz diye de abartmaya gerek yok

```
/**
 * The name.
 */
private String name;
/**
 * The version.
 */
private String version;
/**
 * The licenceName.
 */
private String licenceName;
/**
 * The version.
 */
private String info;
```

Kapama parantezler var bir de:

```
public class WC {
    public static void main(String[] args) {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        String line;
        int lineCount = 0;
        int charCount = 0;
        int wordCount = 0;
        try {
            while ((line = in.readLine()) != null) {
                lineCount++;
                charCount += line.length();
                String words[] = line.split("\\W");
                wordCount += words.length;
            } //while
            System.out.println("wordCount = " + wordCount);
            System.out.println("lineCount = " + lineCount);
            System.out.println("charCount = " + charCount);
        } // try
        catch (IOException e) {
            System.err.println("Error:" + e.getMessage());
        } //catch
    } //main
}
```

Flutter'ın kendisinde vardı bu özellik ve çok kullanışlıydı. Ama tabi, Flutter'da 1000 satırlık kod bile yazanlar olduğunu düşünürsek bu özellik mantıklıydı ama Flutter'ın en büyük sıkıntısı buydu. Algoritma yazmayı iyi bilmeyen biri için Flutter çok laf kalabalığı yapılan yerlerden biriydi. Neyse konuya dönecek olursak bu kapama parantez yorumları çok od satırı için iyi az satır için laf kalabalığı

Stackoverflow da ki [What is the best comment in source code you have ever encountered? [closed]](https://stackoverflow.com/questions/184618/what-is-the-best-comment-in-source-code-you-have-ever-encountered) başlığında yazılan yorum satırlarına bakın. ahahahaa 😂😂😂😂😂 Gerçekten de asıl iş hayatında çıkan yorumlar bunlar oluyor işte. Biz yine de elimizden gelen en iyi yorumları yazmaya çalışalım. Bu yorumları gördüğümüzde de kızmak yerine sadece tebbessüm edelim.

## Chapter 5 - Formatting

