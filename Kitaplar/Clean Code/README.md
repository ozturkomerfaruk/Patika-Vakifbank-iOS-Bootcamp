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

Her projenin kodlarının yazıldığı bir format biçimi vardır. Bu biraz da kurum kültürüyle alakalı bir olaydır. Her insanın kendi kafasına göre projeyi şekil vermesi son derece yanlıştır. Bir format biçimi belirlenir ve projeye dahil olanlar ona uymak zorundadır. Mesela bu repo içerisinde ben Linkedin, Airbnb gibi şirketlerin Style guidline larını paylaştım onlara bakabilirsiniz. Orada da açıkça gözüküyor ki, bir sistem var ve herkes o sisteme tabi olarak kod yazıyor.

1. Dikey Formatlama

Fonksiyonerliği anlatırken aslında bahsetmiştim biraz. Bir sayfada kod satırı ne kadar fazlaysa o kadar sıkıntılı durumlar yaşanabilmektedir. Bu durum aslında kurum kültürü olarak da belirtilebilir mesela denilebilir. Swift de iOS programlanırken, en fazla 400 satır kod olacak gibi...

2. Gazete Metaforu

Gazete gerçi artık kalmadı ama aslında yazarın burada demek istediği şey şu. Bir haber sitesine girdin ve o haber sitesine girdiğinde ilk aradığın özellik ne oluyor. Sayfanın başında, o haberin kısa bir özetini görmek isteriz. O özet bize her şeyi sunar her şey hakkında bilgi verir. Detaylar aşağıdadır. Aşağıya indikçe, haberin detaylarını daha da öğreniriz. İşte kod dünyası da böyle olmalı. Başta kısa bir özet, class ve metot isimleri çok net, aşağı indikçe detaylar belirgin.

3. Kavramlar Arası Dikey Açıklık

Mesela class imzası ile altında değişkenler tanımlanırken aralarında boşluk bırakılması gerektiğidir. Bu tip dikey açıklıklardır aslında. Buna mesela şu örnekte verilebilir. Bir değişken tipini alt alta yaz o bittikten sonra başka bir tipe geç. Aralarında boşluk bırak. Bu o kadar düzenli oluyor ki. Kafanızda canlanmadıysa şöyle düşünün. Bulaşık yıkacaksınız, kocaman bir leğenin içine tabak çanak kaşık çatal vs. her şeyi doldurup tek tek yıkamak mı daha hızlı yoksa ilk önce tabakları bir kenera koyup, bardakları bir yere koyup, çatal kaşıkları bir yere koyup yıkamak mı tek tek daha hızlı. 

4. Dikey Yoğunluk

Yukarıda bir örnek vardı adam String değişken tanımlayacak ismi username mesela, üstünde kocaman yorum satırı. Username yazıyor. Yahu buna böyle detaylar verilmesine ne gerek var? Yoğunluk fazla olmayacak, sade ve öz olacak. Yorum satırı her yere yazılmayacak ama öz yazılacak.

5. Dikey Uzaklık

İşte güzel yerlerden birisi daha. Bazı arkadaşlar kod yazarken bunu hiç umursamaz. Döngünün süslü parantezleri çok uzak yerlere itilmiş, parantezler birbirinden kopmuş gitmiş. Flutter da bu çok yaşanıyor. Orada her şeyin düzenli olması gerekmekte, bir sistemin olması gerekmekte. Eğer her şey böyle olursa, karmaşıklık, düzensizlik hatsafhada olur. Çözüm ne biliyor musunuz, çözüm gerçek manada bir formatlama sistemine herkesin ayak uydurmasıdır.



Diğer bir husus da Değişkenlerin tanımlanma kuralıdır. Değişkenler kafalarına göre tanım gerçekleşmemesi gerekir. Kullanıldıkları yere en yakın şekilde tanımlanmalıdır. Öbür türlü laf karmaşıklığı

Döngü içinde kullanılan değişkenlerde, döngüyle beraber tanımlanmalı

**Dependent Fonksiyonlar**

Birbiriyle girintili fonksiyonlar varsa bunlar mümkün olduğunca alt alta yazılmalıdır çünkü anında ona ulaşabilmek, ve kod okunurluğunu artırmak isteriz.

Eskiden monitörler küçük olduklarında, bir kod satırını yana kaydırılamayacak şekilde uzun olmasın derlermiş. Vay be! Şimdi 32 inç bir monitörde küçük font boyutunda bir yazıda yan yana Allah bilir kaç satır kelime sığar. Ben deyim 500 sen de 1000 satır yani. Bu doğru bir şey değil hocam. En fazla 120 karakter olmalı bir genişlik. Taş çatlasın çevresi.

**Yatay Açıklık ve Yoğunluk**

Dikey boşluk gibi buda önemli meselelerden birisidir. Burada, dikkat edilmesi gereken kurallardan biri yine yoğunluğu seyrelttirmektir. Amaç güzergahlarımızdan birisi mesela atama işlemi yaparken 4 += 5 diyeceksek bu aradaki boşluğu koy abi. Çekinme ya. Haftalar sonra koda baktığında bir eciş bücüş bişey oluyor. Anlayana kadar kılı kırk yarıyorsun.

**Girintileme**

Bir sınıf hiyerarşilerden oluşur. Sınıf içerisinde metotlar, metotlar içerisinde bloklar… Bu hiyerarşinin her bir seviyesi isimlerini tanımlayabildiğimiz kapsamlardır ve kapsamların bu hiyerarşilerini görünür yapabilmek için konumlarına göre satırları girintilendirmemiz gerekir.

Bir sınıf içerisindeki metotlar sınıfın bir seviye sağına, metotların gerçekleştirimleri bu metot tanımlarının bir seviye sağına, metot içerisindeki bloklar ise her bir bloğun sağına girintilidir. Girintileme olmadan programlar insanlar tarafından neredeyse okunmaz olurdu.

**EN ÖNEMLİ BAŞLIK**

Bir ekibin parçasıysan, başlatmayacan kendi formatlama kurallarından. O ekibe uyacaksın. Ekibi sen inşa ediyorsan, sen kendi kurallarını dayatıcan. Bunun raconu budur hocam. Ha derlerse projeye başlamadan önce hadi bir formatlama biçimi konuşalım. İşte gerçek racon budur. Böyle daha sağlıklı kod geliştirilir. Bunu zaman kaybı olarak görmek ne kaybettirir biliyor musunuz? Daha doğrusu formatlamayı umursamadan projeye başlamak size ne kaybettirir? Eğer proje büyük bir projeyse daha projenin ortasında her kafadan bir ses çıkmasından hapı yutarsınız. Ben Swift diliyle daha büyük bir projede henüz çalışmadım. Ama garipsediğim olaylardan birini anlatım. Mesela TableView ın metotlarını ayrı bir extension içerisinde yazan da var, yazmayan da. Eğer her sayfada bu kural değişirse, nerde bu tableview metotları diye dövünüp durursunuz. Hiç gerek yok hocam. Hiç gerek yok.

Chapter 6 - Objects and Data Structures

Bir yazılımın en temellerinin anlatıldığı bir bölüme geldik. Bu bölüm kapsamında öğreneceğimiz belki yüzlerce şey var. Bunlardan bir tanesi Get ve Set metotları

Her değişkeni olabildiğince private yaparız ve get set ile bunları public haline getiririz. İyi de neden? Yani daha doğrusu Nesneler ve Veri yapıları kavramları bunlar tam olarak nedir ve ne için kullanılırlar?

1. Veri Soyutlama

Get ve Set yaygın bir kullanım şeklidir yazılım camiasında. Biz de bu kavramı detaylamasına bir bakalım şimdi. Öncelikle amacımız nesnenin içindeki nesneleri soyutlamaktır. Yani dışarıdan manipüle edilmesini engellemek. Olabildiğince, nesne içerisinde kullanılan metodolojileri, nesneleri vs. açığa çıkarmamaya gayret ederiz. Bu yüzden ne yapılacaksa Set ve Get içinde yaparız. Peki sizce bu kadarı yeterli mi? Şimdi 2 örnek inceleyelim.

```
public interface Vehicle {
    double getFuelTankCapacityInGallons();
    double getGallonsOfGasoline();
}
```

```
public interface Vehicle {
    double getPercentFuelRemaining();
}
```

Masum gibi görünen bu arayüz ekranında da, şunu görmekteyiz. Bir sınıf, değişkenlerini getter ve setter metotlar aracılığı ile dışarı açmaz; aksine gerçekleştirimi bilmelerine gerek olmadan veriyi değiştirmelerine izin veren arayüzleri açar.

İkinci örnek makbüldür. Verimizin detaylarının açığa çıkmasını istemeyiz. Sadece mesele Get Set değil yani burada olay.  Gerçek niyetimizi, nesnenin içerdiği veriyi en iyi şekilde temsil edebilecek şekle sokmalıyız. En kötü seçenek ise getter/setter metotları eklemektir.

2. Veri / Nesne Anti-Simetrisi

Prosedürel kod yani veri yapılarını kullanan kod, mevcut veri yapılarını değiştirmeden yeni fonksiyonlar eklemeyi kolaylaştıran koddur. Nesne taban mantığı ise mevcut fonksiyonları değiştirmeden yeni sınıflar eklemeyi kolaylaştırır. Bunlar birbirine zıt kavramlardır esasında. Ancak ikisini de kullanmayı doğru bilmek gerekmektedir.

Bir proje geliştiriyorsunuz diyelim. Nesne taban mantığını iyi bilmek, o projeyi daha kolay yönetebilmenizi sağlar. Ancak veri yapıları mantığını bilmek ise o projeyi daha efektif kullanmanızı sağlar. Birinde çok iyi kodlar yazabilirken, diğerinde çok iyi o kodları birbiri içerisinde paslaşabilmeyi sağlarsınız.

Prosedürel kod mantığı nesne yönelimli kod eklemeyi zorlaştırabilir çünkü tüm fonksiyonlar değişmelidir Nesne yönelimli kod ise yeni veri yapıları eklemeyi zorlaştırabilir. Yani, nesne yönelimli için zor olan şeyler prosedürel için kolay, prosedürel için zor olanlarda nesne yönelimli için kolaydır.

3. Demeter Kuralı (Law of Demeter)

Evet, yeni bir söz dizimi var. Nedir bu hocam? Hocam bu kural: Bir modül, değiştirdiği bir nesnenin içini bilmemeli, der. Get set metodunda olduğu gibi, nesne içini açmaz işlemlerini herkese açık hale getirir.

***Talk to friens, not to strangers*** cümlesini küçükken heralde her anne söylerdi bizlere değil mi 😅 İşte aynı burada ki gibi, Eğer sınıfımıza izin verilen dışarıdan fonksiyonlar geliyorsa, bunlar da dışarıdan çağrılmaması gerekmektedir.

```final String outputDir = ctxt.getOptions().getScratchDir().getAbsolutePath();```

Bakın burada bu kuralın ihlali vardır. getOptions'da bu mesele bitmeliydi. Orada başka yere sıçrıyor oradan da başka yere sıçrıyor. NOOOOO!!!

4. Tren Enkazları

İşte hemen yukarı da ki örnek buna örnektir. Bir tren kazası olmuştur burada. Birbirini tekrar eden, birileri sürekli çağıran olaylar vardır burada. Yukarı da ki örneği bi düzeltelim hele.

```
Options opts = ctxt.getOptions();
File scratchDir = opts.getScratchDir();
final String outputDir = scratchDir.getAbsolutePath();
```

Ancak ikinci ve üçüncü kurallar yine Demeter kuralını ihlal etmektedir. ctxt, opts ve scratchDir'in nesne ya da veri yapısı olup olmamasına bağlıdır bu durum. Eğer nesne iseler neydi olay, iç yapısı saklanmalıydı. İç yapılarını biliyoruz ve bu bir ihlal. Eğer veri yapılarıysa bunlar neydi o, doğal olarak iç yapılarını açık ediyorlardı direk. Demeter Kuralı ihlali var burada.

Şu şekilde olsaydı muhtemelen sıkıntı olmayacaktı.

```
final String outputDir = ctxt.options.scratchDir.absolutePath;
```

Yani burada bir metot ile erişildiğinde direk iç yapısını öğrenebiliyorsak buna gerek yok ancak burada direk classlarına gidiyoruz.

Peki bu ctxt, opts, scratchDir nesne yönelimli olsaydı? O zaman iç yapılarını gizlemek zorunda kalacaklardı ve bu şekilde olmalıydı.

```
ctxt.getAbsolutePathOfScratchDirectoryOption();
```

ya da şöyle:

```
ctx.getScratchDirectoryOption().getAbsolutePath()
```

İkinci seçenek getScratchDirectoryOption() metodunun bir nesne değil bir veri yapısı olduğunu varsayıyor ve burada iki seçenek de iyi durmuyor.

Eğer ctxt bir nesne ise, ona bir şeyler yapmasını söylemeliyiz, ona içindekileri sormamalıyız. (Tell Don’t Ask prensibi) O zaman neden scratchDirectory’den absolutePath’i istiyoruz? Onunla ne yapacağız?

Olaylar nerelerden nerelere geldi değil mi? Amaaaan ne olacaaak sanki beaa der gibi misiniz, yoksa detayları daha da sorgulama eşiğinde mi? Bakalım Clean Code yazarı bu olayı nereye kadar götürecek?

Ctcx de şu satırlar eklenebilir. Slash olarak kullanılanlar, anlayacağınız üzere File Path için.

```
String outFile = outputDir + "/" + className.replace('.', '/') + ".class";
FileOutputStream fout = new FileOutputStream(outFile);
BufferedOutputStream bos = new BufferedOutputStream(fout);
```

yukarıda ki örnek satırlarında ki AbsolutePath şu şekilde istenmeli artık

```
BufferedOutputStream bos = ctxt.createScratchFileStream(classFileName);
```

Ne oldu, ne değişti burada der gibi misiniz? Burada gerçekleşen örnekte ortaya çıkan sonuç şu şekildedir. Ctxt'nin iç yapısı gizlenmiş oldu ve Demeter kuralı da ihlal edilmiyor artık oldu. Detaylamasına ne inceledik be! Yalnız şunu söyleyim. Bu ihlallerin ne demek olduğunu, eğer bir iş hayatına girdiyseniz, görmeniz daha belki de canlı canlı neden yanlış olduğunu anlamanız daha mantıklı bile olabilir. O zaman burada yazılanların daha doğru olduğunu anlıyoruz. Zaten Clean Codee kitabında da Pragmatic Programmer kitabında da görmüş olduğumuz şeyler hep bi iş hayatı tecrübesi yaşayan insanların aslında neden 

5. Veri Aktarım Nesneleri (Data Transfer Objects)

Veri yapısı, public değişkenleri olan, fonksiyonları olmayan sınıflardır. Java da DTO mantığı gibi ya da Bean formu gibi. Nesne yönelimli programlamaya çok dikkat eden kişiye bu olay kendini iyi hissettirmek için vardır. Başka amacı yok. Ahahah.

6. Melez Yapılar

Hem private'ı hem public'ı esas olan yapılardır. Bunlar karmaşıklığa sebep olur. Bunlardan olabildiğince kaçınmaya çalışmak gerekmektedir.

7. Aktif Kayıtlar

DTO'ların özel formatlarıdır ancak **save** ve **find** gibi yönlendirici metotları vardır. Bir aktif kayda veri yapısıymış gibi davranmak ve iş kurallarını içeren ayrı nesneler yaratarak iç yapıyı saklamak, onlara nesnelermiş gibi davranmasına sebebiyet verir.


7 Madde de, veri yapıları ve nesne taban mantığını inceledik. İyi yazılımcılar, Clean Code prensiplerine uyan yazılımcılar, hangi koşulda hangilerinin kullanılması gerektiğini iyi analiz eden yazılımcılardır.


## Chapter 7 - Error Handling

Yazılımcının en güzel yanlarından biri de hata çözmektir be! 😂 Tamam tamam gülmeyin gerçekten bu durum bazen çok canımızı sıkabiliyor. Burada da devreye tecrübe giriyor artık o hatalar çıktıkça insan tecrübe kazanıyor ve zamanında bir şeyler yaptım da çözdüm diyebiliyor. Bu yüzden biz yazılımcılar bu hatalara karşı her zaman dirençli olmaya çalışmalıyız.

1. Use Extension Rahter Than Return Codes

Önceden extension ile kod yazmak sınırlıydı kodlama dillerinde, ancak günümüzde bunu istediğimiz gibi kullanabiliyoruz. Önceden de daha çok Flag döndürme gibi olaylar vardı. Birinci sınıfta mühendislikte, C dersi alırken de hoca bize hatta Flagler üzerinden ders anlatıyordu. Asal mı değil mi vs. hatırlıyorum da ancak bu artık kullanılması gereken bir yol değil, özellikle mobil programlama dillerinde

Çünkü bu tür yaklaşımlar, başka bir yazılımcının kafasını karıştırabilir bunları çağırırken. Eğer flag yöntemi ile vs. yapılacaksa olay, çağırdıktan sonra bunların tek tek kontrol edilmesi gerekmektedir fakat böyle bir şey yapılmıyor genellikle de unutuluyor. Bu yüzden bir hatayı throw etmek makbüldür.

2. Write Your Try-Catch-Finally Statement First

Try-Catch yapıları programlamaların belki de yapı taşlarından birisidir. Try ile yazmak istediğinizi yazabilir ve catch blogu ile hatayı fırlatabilirsiniz. Finally de ise ne olursa olsun şu dönsün diyebilirsiniz.

```
public List<RecordedGrip> retrieveSection(String sectionName) {
    try {
        FileInputStream stream = new FileInputStream(sectionName)
    } catch (Exception e) {
        throw new StorageException("retrieval error", e);
    }
    return new ArrayList<RecordedGrip>();
}
```

Try blogunda eğer patlarsa  catch blogunda hata throw edilebilmektedir bu şekilde. Buna benzer yapı hemen hemen her dilde kullanılmaktadır.

Try blogu ile extension yapılarını zorlayacak kodlar yazmalıyız bu kodlar sayesinde ileride bakım yapılacaksa ya da test yazılacaksa çok daha kolay yazılabilmektedir.

3. Use Unchecked Exceptions

**Açık / Kapalı Kuralı** Metodunuzdan kontrollü bir istisna fırlatırsanız ve catch üç seviyeden fazlaysa, o istisnayı sizinle catch arasındaki her metodun imzasında belirtmeniz gerekir. Bu demektir ki, düşük seviyede bir değişiklik, imza değişikliklerini daha üst seviyelerde zorlayabilir. Onları ilgilendiren hiçbir şey olmadığı halde, değiştirilen modüller yeniden derlenmeli ve dağıtılmalıdır.

Büyük sistemlerdeki çağırma hiyerarşilerini düşünün. En alt seviye metotlardan birisinin bir istisna fırlatacak şekilde düzenlenmesi durumunda, çağıran tüm metotlar da imzasına bir throws eklemek zorundadır. Bu durumda kapsülleme de (encapsulation) bozulmuştur çünkü değişen metotlar da artık bu istisnanın detaylarını biliyor olacaktır.

4. Provide Context with Exceptions

Her hata throw edildiğinde, hatanın yerine alacak yeterli bilgi sağlanmalıdır. Bir hata aldığında bir yazılımcı ona yeterli bilgiyi sağlayın. Başarısız olan işlemden, hatanın tipinden bahsedebilirsiniz.

5. Define Exception Classes in Terms of a Caller’s Needs.

Hataları sınıflandırabilmenin bir sürü yolu vardır; kaynaklarına göre, türlerine göre sınıflandırabiliriz. Şu sınıflandırma örneğine bakalım. Üçüncü taraf bir kütüphane çağrımı için try-catch-finally yazılmış. Çağrılardan fırlatılabilecek tüm istisnaları kapsıyor:

```
ACMEPort port = new ACMEPort(12);
try {
    port.open();
} catch (DeviceResponseException e) {
    reportPortError(e);
    logger.log("Device response exception", e);
} catch (ATM1212UnlockedException e) {
    reportPortError(e);
    logger.log("Unlock exception", e);
} catch (GMXError e) {
    reportPortError(e);
    logger.log("Device response exception");
} finally {
    ...
}
```

Bu ifadede çokça tekrarlanmış kod var. Burada yaptığımız işin kabaca aynı olduğunu bildiğimizden çağırdığımız API’yi sararak (wrapping) ve ortak bir istisna tipi döndüğünden emin olarak kodumuzu önemli ölçüde basitleştirebiliriz:

```
LocalPort port = new LocalPort(12);
try {
    port.open();
} catch (PortDeviceFailure e) {
    reportError(e);
    logger.log(e.getMessage(), e);
} finally {
    ...
}
```

LocalPort sınıfımız, ACMEPort sınıfından atılmış istisnaları yakalayan ve çeviren basit bir sarmalayıcıdır (wrapper):

```
public class LocalPort {
    private ACMEPort innerPort;
    public LocalPort(int portNumber) {
        innerPort = new ACMEPort(portNumber);
    }
    public void open() {
        try {
            innerPort.open();
        } catch (DeviceResponseException e) {
            throw new PortDeviceFailure(e);
        } catch (ATM1212UnlockedException e) {
            throw new PortDeviceFailure(e);
        } catch (GMXError e) {
```

Sarmalayıcı sınıflar üçüncü taraf API’lerin detaylarını gizlemek için en iyi pratiktir. Belli bir tedarikçinin API’sine bağlı olmazsınız ve rahat hissedebileceğiniz bir API tanımlayabilirsiniz. Ve ileride farklı bir kütüphaneye geçmek istediğinizde, sarmalayarak minimize ettiğiniz bağımlılıklar ile geçiş yapmak çok daha kolaydır.

4. Define the Normal Flow

Special Case Pattern kullanılabilir. Özel durumlarla senin için başa çıacak bir sınıf yaratır ya da bir nesne ayarlarsın. Bunu yaptığında, ön yüz kodu istisnai durumlarla uğraşmak zorunda kalmayacaktır. Bu davranış özel durum nesnesi yani Special Case Pattern ile kapsüllenmiş olmaktadır. Açıkçası bu duruma internetten detaylamasına, ya da Youtube'dan video izlemenizi tavsiye ederim.

5. Don’t Return Null

null döndüğümüzde aslında gene kendimize iş çıkarıyor ve topu fonksiyonumuzu çağıranlara atıyoruz. Uygulamanın kontrolden çıkması için tek bir eksik null kontrolü yeterli gibi görünüyor. Eğer bir metottan null dönecekseniz, onun yerine istisna fırlatmayı ya da bir Special Case nesnesi dönmeyi düşünün. Eğer kullandığınız bir API’den null dönebilecek bir metot çağırıyorsanız da, bu metodu özel durum nesnesi dönen ya da istisna fırlatan bir metot ile sarmalamayı düşünebilirsiniz.

6. Don’t Pass Null 

Metotlardan null dönmek kötü bir pratiktir ancak metotlara null geçmek daha da kötü bir pratiktir. Sizden null bekleyen bir API ile çalışmadıkça, kodunuzda mümkün mertebe null geçmekten kaçınmalısınız.

Nedenini anlamak için şu örneğe bakalım; iki nokta için bir metrik hesaplıyor:

```
public class MetricsCalculator {
    public double xProjection(Point p1, Point p2) {
        return (p2.x– p1.x) * 1.5;
    }
}
```
Hocam burada ya null dönerse ne olacak? ```calculator.xProjection(null, new Point(12, 13));```

NullPointerException ile karşılaştık tabiki.

```
public class MetricsCalculator {
    public double xProjection(Point p1, Point p2) {
        if (p1 == null || p2 == null) {
            throw InvalidArgumentException(
                "Invalid argument for MetricsCalculator.xProjection");
        }
        return (p2.x– p1.x) * 1.5;
    }
}
```
Çoğu dilde istemeden gönderilmiş null değerler ile uğraşabilmenin bir yolu yoktur. Durum böyle olduğundan, burada en gerçekçi yaklaşım null değerlerin gelmesini önlemektir.

Bakın Clean Code demek sadece kodu güzel bir şekilde okumak demek değildir kodun aynı zamanda güçlü olması demektir. Güçlü kod, aslında okunabilen koddur. Evet onu elimizden geldiğince sadece yazmamız gerekir, ki daha çok insana hitap etsin ama temiz kod yazdık deyip, sürekli hata ile karşılaştıran bir kod yazarsanız orada bazı sıkıntılar var demektir. Eğer hata işlemeyi bağımsız bir iş olarak görürsek, temiz ve güçlü kodlar yazabilir ve kodumuzun sürdürülebilirliği konusunda büyük adımlar atabiliriz.

## Chapter 8 - Boundaries

Bazen projelerimize açık kütüphane kodları eklemek ya da 3. parti kütüphaneler kullanmak isteriz. Bazen de ekip içerisinde başkaları bunu yapar bizler de bu yabancı kodları tam manasıyla, doğru bir şekilde entegre etmek isteriz.

Üçüncü paket sağlayıcıları, birçok ortamda çalışabilir olmaları için çaba gösterirler. Diğer taraftan da kullanıcılar sadece belirli arayüzleri kullanmak isterler.

Bunu aslında çeşit çeşit dillerde görmek mümkündür. Bu durumu JAVA dilnide şöyle söyleyebilirim sizlere. Belki bir örnek teşkil eder ve size kendi hakim olduğunuz dilde anımsatır olayı.

Map'leri düşünün. Birçok şeyi yapabilme gücü vermektedir bizlere. Ancak ne diyordu Spiderman abimizin Ben amcası. Büyük güç büyük sorumluluk getirir. Aynen o şekil, burada da sorumluluklarımız bulunmaktadır. Örneğin uygulamamızda bir Map kullanıyor ve onu bir yerlere argüman olarak geçiyor olalım. Map’imizi kullananların içerisinden hiçbir şey silmemesi gerekebilir. Ancak Map arayüzü clear() metoduna sahiptir ve Map’i kullanan herkes bu güce sahiptir. Ya da tasarımımıza göre Map üzerinde sadece belirli tipte nesneleri tutuyor olabiliriz. Fakat Map, içindeki nesnelerin tiplerini güvenilir şekilde sınırlandırmaz. Herhangi bir kullanıcı, herhangi tipte bir nesneyi Map’e ekleyebilir.

``` Map sensors = new HashMap();```

olarak oluşturduk ve sensorlere erişmek istiyoruz.

```Sensor s = (Sensor)sensors.get(sensorId);```

```
Map<Sensor> sensors = new HashMap<Sensor>();
.....
Sensor s = sensors.get(sensorId);
```

Map<Sensor> örneğini (instance) serbestçe bir yerlere argüman olarak geçirmek demek; Map arayüzü her değişiklik yaptığında, düzeltilecek çok yerin olacağı anlamına gelir. Böyle bir değişikliğin pek olası olmadığını düşünebiliriz ancak Java 5'te Generic’lere destek geldiği zamanı hatırlayın. Map’lerin özgür kullanımını telafi etmek için gereken büyük değişiklik nedeniyle Generic kullanımını engelleyen sistemler gördük.

Ancak en güzel şu şekilde kullanılır:

```
public class Sensors {
    private Map sensors = new HashMap();
    public Sensor getById(String id) {
        return (Sensor) sensors.get(id);
    }
    ...
}
```

Map’in her kullanımında bu şekilde kapsüllenmesini önerilmiyor. Bunun yerine, Map’leri (veya sınırdaki başka herhangi bir arayüzü) sisteminizde bir yerlere geçirmemeniz tavsiyeediliyor.. Map gibi bir sınır arayüzü kullanılıyorsa, onu sınıfın içinde tutmalıyız. Map’leri return etmekten ve public API’lere argüman olarak geçmekten kaçınmalıyız.

Boundaries yani Sınırları Keşfetmek ve Öğrenmek

3. parti kullanmak kısa sürede çok fazla işlevsellik insana kazandırmaktadır. Bu doğrudur. Ancak bunu en güzel şekilde yapmanın yolu test yazmaktan geçer. Bunu aslında iOS da ya da başka bir mobil uygulama geliştirme de görebiliyoruz. 3. parti bir kütüphane yayımlıyor başkaları sonra onu entegre etmeye çalışıyoruz. Bazen oluyor, bazen olmuyor saçma sapan durumlar oluyor. Onlar doğru kod yazdılar mı bilmiyoruz yoksa biz mi geçirirken hata yapıyoruz diyoruz. 3. parti kodları yönetmek, öğrenmek, entegre etmek zordur.

Jim Newkirk diye bir abimiz de bize test yapmamız gerektiğini söylüyor. Onlara learning tests diyor yani öğrenme testleri. Bu testler ile projeye entegre edilip edilmemesi gerektiğini öğrenebiliyormuşuz.

Mesela loglar için Log4j kullanılacak diyelim. Test yazdık ve ekrana hello yazsın dedik. Bir hata verdi dedi Appender'a ihtiyacın var. Bu ne dedin. ConsoleAppender çıktı. Neyse yükledin ama Appender'ın çıktı üretmediğini farkettin. Google da arattın. Çözümü buldun ve hatayı engelledin. Hello yazdırdın. Aferin. Ne oldu?

İlginçtir ki, ConsoleAppender.SYSTEM_OUT bağımsız değişkenini kaldırdığımızda, “hello” ifadesinin yine de yazdırıldığını görüyoruz. Fakat PatternLayout’u çıkardığımızda, gene hata alıyoruz. Bu çok garip bir davranış. Dokümantasyona biraz daha dikkatli baktığımızda, varsayılan ConsoleAppender kurucusunun “yapılandırılmamış” olduğunu görüyoruz. Bu Log4j’de hata veya en azından bir tutarsızlık gibi görünüyor. İşte biz bu durumları yaşayabilirz. Bu yüzden kendi testlerimizi yaza yaza gitmek zorundayız.

Öğrenme testlerinde neden test yazılır, biliyor musunuz? Şu sebeple,  üçüncü taraf yazılımların yeni sürümleri çıktığında, davranış farklılıklarının olup olmadığını görmek için öğrenme testleri kullanılır. Bu öğrenme testlerinin maliyeti yok. Zamanın mı gidiyor sonuna kadar değer hocam. Öğrenme testlerinin sağladığı bilgiye ihtiyacınız olsun veya olmasın, üretim kodunun yaptığını yapan testleriniz tarafından uygulamanızda temiz bir sınır çizilmelidir.

Clean Boundaries - Temiz Sınırlar

Sınırlarda değişimler olur. Sabit değildir. İyi yazılımlar, büyük yatırımlar ve yeniden çalışmalar olmadan değişikliklere uyum sağlamaya baklılır. Sınırlardaki kod, beklentileri tanımlayan kesin ayırımlara ve testlere ihtiyaç duyar. Kodumuzun üçüncü taraf yazılımların ayrıntılarıyla ilgili çok fazla şey bilmesini önlemeliyiz. Kontrol etmediğimiz bir şeyden çok, kontrol ettiğimiz bir şeye güvenmek daha iyidir, çünkü sonunda o bizi kontrolü altına alacaktır.

Üçüncü parti kodları entegre etmek risklidir, onlara sorgusurz sualsiz güveniriz ama ne işe yaradığını bilmeden kullandığımız her 3. parti kod bizi yormaktadır. Nasıl, ona ayıracağın zaman gibi. Ayrıca büyük bir projede çalışırken, 3. parti kullandığın kodlar ya sana istediğini vermemeye başlarsa, ya bi güncelleme ile artık kullanılamaz olursa ya silinir giderse ne olacak? Bu kadar körü körüne bağılılık düşündürmektedir insanı. Dikkat etmeliyizdir.

## Chapter 9 - Unit Tests

