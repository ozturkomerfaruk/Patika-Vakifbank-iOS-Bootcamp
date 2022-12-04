Bu kitapta ki konu başlıklarını özetler nitelikte, kendimden cümlelerle yazmaya çalıştım. Kitabı okumanızı muhakkak tavsiye ediyorum.

## İçindekiler

* [Chapter 1](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-1---clean-code)
* [Chapter 2](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-2---meaningful-names)
* [Chapter 3](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-3---functions)
* [Chapter 4](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-4---comments)
* [Chapter 5](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-4---comments)
* [Chapter 6](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-6---objects-and-data-structures)
* [Chapter 7](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-7---error-handling)
* [Chapter 8](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-8---boundaries)
* [Chapter 9](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-9---unit-tests)
* [Chapter 10](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-10---classes)
* [Chapter 11](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-11---system)
* [Chapter 12](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-12---emergence)
* [Chapter 13](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-13---concurrency)
* [Chapter 14](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-14---successive-refinement)
* [Chapter 15](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-15---junit-internals)
* [Chapter 16](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#chapter-16---refactoring-serialdate)
* [Son Olarak](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/blob/master/Kitaplar/Clean%20Code/README.md#son-olarak)

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

## Chapter 6 - Objects and Data Structures

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

Bu bölüme başlamadan önce gerçekten Unit Test kavramını o kadar çok duymaya başladım ki, hem backend programlamada hem Flutter da hem iOS da.. Bu test kavramlarının arasında gerçekten en popüleri. Bakalım neymiş bu? Neymiş detaylı olarak??

    
Her satır blogunun çalışıp çalışmadını test etmek için birim testleri kullanılır. Agile ve TDD prensipleri insanları birim test yazmaya epey bi teşvik etti. Günümüzde artık birim test yazmamak abes kaçacak hale geldi. 90lı 2000li yıllarda tabi birim test anlayışı farklıydı. Bu şekilde değildi. O zaman kimse TDD'yi bilmiyordu bile. Test Driven Development yani. Program çalışsın yeter deniliyordu.
    
TDD'nin 3 kuralı:
    
1. Geçmeyen bir birim testi yazmadan, üretim (uygulama) kodu yazmamalısın.
2. Aynı anda birden fazla geçmeyen birim testi yazmamalısın. Derleme hatası da geçmeyen test demektir.
3. O andaki geçmeyen testi geçirecek üretim kodundan başka üretim kodu yazmamalısın.
    
Bu 3 kuralı uymaya çalıştığınızda binlerce onbinlerce test yazıyor olacaksınız. Bunlar gerçek manada bir uygulama piyasaya çıkarken ona her türlü durumdan çıkma, başetme yeteneği kazandırmaktadır.
    
Ancak testler yapılacak diye körü körüne test yapılmaması gerekmektedir. Bir makina mühendisini düşünün ve TOGG arabasını test edecek diyelim. Yapacağı test çarpışma anında AIR BAG'lerin açılma durumu olsun. Test yapması için ne yapması gerekiyor elbetteki sınırları zorlamak ve teste uygun hareket etmek. Ne demek istiyorum, arabayı bir yere çarptıracan ki, patlaması gerektiğini bilsin AIR BAG. Ancak arabayı 4 şeritli, kimsenin gelmediği bir zaman diliminde patlamasını isterseniz. Biraz zor beklersiniz bu durumu? Aynı şekilde yazılımda da test yazılması gerekmektedir. Kirli test, hiç test olmamasından iyidir ancak sadece çözüm bu değil tabi ki, çünkü bazen kirli test hiç olmasa iyidir. Çünkü daha fazla zaman kaybı olacakken engellemiştir durumu.
    
Eğer testler ne kadar çok kirli bir hal alırsa, o kadar çok yük olarak gözükür. Test meselesi gerçekten bir mühendislik işidir. Hafife alınmayacak bir iştir. Eğer sayfa tasarımları, mimari uygulama, dizayn paternler vs. uygulanmazsa bir projede test yazmak ne kadar zorlaşacağı gibi; test yazarkende ona özenmeden yazmak çok fazla güçlük sergiletir. Örneğin aylar sonra testleri temiz yazmaya karar verdiniz ve testleri uyguladınız ancak sizin aylar önce yazdığınız kötü, kirli testler bu sefer olumsuz sonuçlar verecek ve onlar için tekrar başlayacaksınız. Bu artık tamamen bir yük haline gelecek ve belkide test yazmaktan vazgeçeceksiniz.

Bu seferde hata / debug olayı fazla olmaya başladı. Sonunda elimize hiç testi olmayan, karışık ve hatalarla dolu üretim kodu, sinirli müşteriler ve test çabalarının başarısız olduğuna dair hisler kaldı.

Test kodu, üretim kodu kadar önemlidir ve üretim kodu kadar da temiz tutulmalıdır. Testler ikinci sınıf vatandaş mualemesi görmemelidir. Test yazmak düşünce, tasarım ve dikkat gerektirir.

Bu yüzden şirketlerde test yazılımcıları vardır. Bu alana özel insanlar vardır. Bu alanın uzmanları vardır. Normal her geliştirici test yazmaya zorunludur ancak bir de bunun alanı olan testerların önünde yapmak vardır.

Mimari yapınızın bile değişmesini istediğinizde korkmuyorsanız eğer, yapacağınız tek şey test yazmaktır. Eşeğinizi sağlam kazığa bağlayan insan, eşeğin gitmesinden korkmaz. Bu şekilde işte, rahat rahat kodunuzu değiştirebilir, bükebilirsiniz. Test önemlidir.

Test önemlidir ancak, öyle bodoslama kod yazılmaz üstadım. Clean olacak, okunabilir olacak. Baktığında bu test kodunu anlayacaksın.

TEST API'daki kodlar, üretim kodları gibi değildir. Doğaları farklıdır. Canlı ortamında yapamadığınız şeyleri yapma hakkına sahipsiniz. MockDatalar oluşturabilirsiniz mesela ya da test ortamında veriyi değiştirebilirsiniz. Yani burada amaç test etmektir burada çalışıyor mu çalışmıyor mu olayından ziyade projenin genel olarak, onun ince detaylarıyla uğraştığınız için yani adı üstünde Unit test - Birim test - olduğu için mesele o yüzden rahat bir şekilde kodlarınızı yazabilirsiniz.

**Template Method**

Önemli bir kısımlardan birisi daha. Given-When-Then ifadeleri yer almaktadır burada. Given & When ile temel bir sınıfa, Then ile farklı türev sınıflarak koyarak kod tekrarlamasının önüne geçilmektedir. @Before ile ve Then kısımları ile her birini ayrı birer @Test fonksiyonu içine konulabilmektedir. Günün sonunda birden fazla assert olan versiyonu da tercih edilebilmektedir.

**Tek Konsept**

Aynı fonksiyonlarda olduğu gibi burada da teklik söz konusudur. Örneğin:

Elimizde 31 günü olan aylardan birinin son günü olsun (örneğin 31 Mayıs);

1. 30 günü olan bir ay eklediğimizde (Haziran gibi), tarih ayın 31'i değil 30'u olmalıdır.
2. İki ay eklediğimizde, ikinci ayın 31 günü varsa , tarih ayın 31'i olmalıdır.
3. 31 günü olan bir ay eklediğimizde tarih ayın 31'i değil 30'u olmalıdır.

Yani soruna neden olan şey birden fazla assert ifadesi değil. Aksine, test edilen birden fazla konseptin olmasıdır. Bu nedenle en iyi kural, konsept başına assert sayısını en aza indirgemek ve test fonksiyonu başına sadece bir konsept test etmektir.

**F.I.R.S.T** 

* Fast: Testler hızlı olmalıdır. Testler yavaş çalıştıklarında, sık sık çalıştırmak istemezsiniz. Testleri sık sık çalıştırmazsanız, problemleri kolayca giderecek kadar erkenden fark edemezsiniz.

* Independent:  Testler birbirine bağlı olmamalıdır. Bir test, bir sonraki testin koşullarını belirlememelidir. Her bir testi bağımsız olarak ve istediğiniz herhangi bir sırada çalıştırabilmelisiniz. Testler birbirine bağımlı olduğunda, hata alan ilki, hiyerarşide aşağılara doğru hatalara sebep olarak ilk hata alınan yerin tespitini zorlaştıracaktır.

* Repeatable: Testler herhangi bir ortamda çalışabilir olmalıdır. Birim testlerini üretim ortamında, QA ortamında ve dizüstü bilgisayarınızda veya trende evinize gidiyorken çalıştırabilmelisiniz. Testleriniz herhangi bir ortamda tekrarlanabilir değilse, başarısız olmalarına hep bir mazeretiniz olacaktır.

* Self-Validating: Testler ya geçerler ya da başarısız olurlar. Testlerin geçip geçmediğini anlamak için bir log dosyasına bakmamıza gerek olmamalı veya elle iki farklı metin dosyasını karşılaştırmanız gerekmemelidir.

* Timely: Testlerin zamanında yazılması gerekir. Birim testleri, yazıldığı üretim kodundan hemen önce yazılmalıdır. Testlerinizi kodunuzu yazdıktan sonra yazarsanız, üretim kodununun test edilmesi zor olabilir. Kodunuzu test edilebilecek şekilde tasarlayamayabilirsiniz.

Okul hayatımda bir işte çalışırken ben testlerin hiç yazılmadığı bir projeye dahil olmuştum. Orada anladım ki test yazmanın gerçekten çok büyük bir önemi varmış. Orada yazılan kodların hiçbir şekilde geçerliliği yokmuş. Sürekli yazılan her kodu düzenli olarak değiştiriyorduk. Destekten bir şikayet geliyor burada patlak var hadi düzelt. Öyle öyle ömür geçmişti gerçekten. Bence siz siz olun testleri gerçekten önemseyin arkadaşlar.

## Chapter 10 - Classes

Agalar her dilin Style Guidline biçimi vardır. Bunun internette dökümantasyonları mevcut. Kitap Java temelinde gidiyor. Javada bir class, değişkenlerle başlamalı. Önce public static olanlar sonra normal public. Daha sonra private static olanlar, sonra normal private değişkenler. Ardından public metotlar sonra private metotlar gelmelidir.

Encapsulation olayı

Değişkenlerin ve util fonksiyonların gizli tutulma işlemidir. Bu get set olaylarıdır.

Sınıfların boyutu

Bir sınıfa ait olan metot sayısının fazla olmaması gerektiğidir. Metot sayısı az, sorumluluğu büyük olmalıdır.

**Single Responsibility Prensibi** Bir sınıf veya modülün değiştirilmesi için gereken tek bir sebebi olması gerektiğini söyler. Bu ilke bize hem bir sorumluluk tanımı verir hem de sınıf büyüklüğü için bir rehber olur. Sınıfların sadece bir sorumluluğu olmalıdır.

Her büyük sistem aynı büyüklükte mantık ve karmaşıklık içerecektir. Yeniden ifade etmek gerekirse; sistemlerimizin birkaç büyük sınıftan değil, birçok küçük sınıftan oluşmasını istiyoruz. Her küçük sınıfın, tek bir sorumluluğu ve değiştirilmesi için tek bir nedeni olmalıdır. Ve istenileni verebilmesi için başka sınıflarla birlikte çalışır.

Burada amaç kodun çalışıp çalışmama meselesi değildir. Kodu daha efektif yazma meselesidir. Yazdığınız kod ister istemeden birden fazla instance üretebilir bu onun hakkıdır belki de. Sizin göreviniz bunu ona o hakkı vermemenizdir. Eğer verirseniz memory şişer bişey olur ne gerek var.

**Sınıf Güncellemesi** Her gelen yenilikte sınıf güncellemesi yapmaya gerek duyulmaz. Ha sınıfı değiştirmeden extends edilerek yeni sınıflar oluşturup onun temelinde üretilmiş sınıflar oluşturabiliriz ya da güncelleriz direk. Ancak burada iki önemli husus vardır.

1. SRP - Single Responsibility
2. OCP - Open/Closed Principle

Bu iki olayın desteklenmesi önemli olandır.

## Chapter 11 - System

Sizce bir belediye başkanı, tüm belediyenin tek başına yönettiği bir insan mıdır?  Yoksa belediye başkanı, bazı kurulların başında ki insan mıdır? Mesela bir kurul parkların yapımında görevli, bir kurul ulaşımdan görevli, bir kurul deprem için araştırma yapan kurul vs. Belediye başkanı tek başına tüm işlerden sorumlu insan olması imkansızdır ancak onu belediye başkanı yapan asıl olay, yürüttüğü kurulların başında olma yeteneğidir.

Bireylerin ve yönettikleri bileşenlerin büyük resmi anlamaksızın etkili bir şekilde çalışmasını mümkün kılan, soyutlama ve modülerlik düzeyleridir. Temiz kod olayı nerede devrereye giriyor derseniz de, soyutlamanın daha düşük seviyelerderinde bunu başarmanıza yardımcı olduğunu söyleyebilirim.

İşte bu bölümde yazar bizlere bir sistem inşasından, soyutlamanın ve modülerlik düzeylerinden bahsetmektedir.

Aslında buna örnek olarak verilebilecek bir husus bulunmaktadır. MVVM mimarisinde, ViewModel ile View arasında ki fark neydi, hatırlarsanız eğer; Sayfaların business logic tarafları ViewModel olarak ayrı bir yerde tutuluyordu. Doğal olarak, burada da anlatılan hususta: Uygulama nesneleri oluşturulurken ve birbiri ile ilişkilendirilirken, nesnelerin oluşturulma süreci çalışma zamanı mantığından (runtime logic) ayrılmalıdır.

İhtiyaç halinde oluşturma (lazy initialization) deyiminin bir kez kullanımı sorun teşkil etmez ancak uygulamalarda bir çok örneği vardır. Güçlü sistemler oluşturmaya gayret gösteriyorsak, küçük, kullanışlı deyimlerin modülerliği bozmasına asla izin vermemeliyiz. Nesnenin oluşturulması ve birbiri ile ilişkilendirilmesi süreci de bir istisna değildir. Bu işlemleri iş mantığından ayrı olarak modülerize etmeli ve bağımlılıklarımızı çözmek için tutarlı bir stratejimiz olduğundan emin olmalıyız.

**Factory Pattern**

Bir sipariş alma sisteminde, Order nesnesine ekleme yapabilmek için LineItem instance oluşturulmalı. LineItem örneklerinin oluşturulmasının kontrolünü de Abstract olan Factory kullanılır. Kontrolde ancak detaylar uygulama kodundan tamamen ayrıdır.

![image](https://user-images.githubusercontent.com/56068905/205496441-82ab3573-2123-42b0-a25e-4cfa89a40cf0.png)

Tüm bağımlılıklar main’den OrderProcessing uygulamasına doğrudur. Bu, uygulamanın bir LineItem nesnesinin nasıl oluşturulacağı ile ilgili detaylardan kopuk olduğu anlamına gelir. Bu detaylar, main’in tarafında olan LineItemFactoryImplementation sınıfında tutulur. Uygulama, LineItem örneklerinin ne zaman oluşturulacağı üzerinde tam kontrole sahiptir, ve hatta uygulamaya özel yapıcı argümanları da sağlayabilir.

**Bağımlılık Enjeksiyonu**

Bir nesne kendi bağımlılıklarının örneklerini oluşturma sorumluluğunu almamalıdır. Bunun yerine, bu sorumluluğu başka bir yetkili mekanizmaya, IoC / DI mekanizmasına bırakmalıdır.

İyi bir bağımlılık enjeksiyonu mekanizmasında; sınıf, bağımlılıklarını gidermek için doğrudan hiçbir adım atmaz, tamamen pasiftir. Bunun yerine, bağımlılıkları enjekte etmek için kullanılan setter metotlar veya yapıcı argümanlar (veya her ikisini) sağlar. Nesnelerin oluşturulma süreçlerinde, DI konteyneri gerekli nesneleri örnekler ve bağımlılıkları ilişkilendirmek için sağlanan yapıcı değişkenlerini veya setter metotları kullanır. Bağımlılıklar genellikle bir konfigürasyon dosyası aracılığıyla belirtilir. Spring Framework, Java için en iyi bilinen DI konteynerini sağlar.

**Big Design Up Front**

Big Design Up Front yaklaşımına göre, yazılımın gerçekleştirimi başlamadan önce tasarım tamamlanmalı ya da mükemmelleştirilmelidir. Genellikle yazılım geliştirmedeki şelale (waterfall) modeli ile ilişkilendirilir. BDUF kulağa hoş gelse de aslında zararlı bir yaklaşımdır. Önceki eforu çöpe atma konusunda oluşacak olan psikolojik direnç nedeniyle değişime uyum sağlamayı engeller. Bu direnç bazen kişisel, ama çoğu zaman ekonomik sebeplerden kaynaklanır. 

Eğer uygulama mimarisinde Seperation of Concerns sağlanmışsa, radikal değişiklikler dahi ekonomik olarak yapılabilir (feasible) olacaktır. Uygulamaya ait mimari kararların tümünün en başta alınması yerine, olabildiğince basit ancak ayrılmış bir mimari (decoupled architecture) ile başlayarak, çalışan uygulama özelliklerini kısa aralıklarla teslim etmeye odaklanılmalı, mimari iyileştirmeler buna paralel ilerlemelidir.

Sistemler de temiz olmalıdır. Kötü bir mimari iş mantığını (business logic) belirsizleştirir ve çevikliği (agility) olumsuz etkiler. İş mantığı gizlendiğinde, hataların bulunması ve yeni özelliklerin eklenmesi zorlaşır. Çeviklik azalırsa, üretkenlik azalır ve TDD’nin faydaları kaybolur.

Soyutlamanın her seviyesinde niyet açık olmalıdır. Sistemler veya bağımsız modüller tasarlarken, çalışabilecek en basit çözümü uygulamayı unutmayın.

Bu size daha öncesinde sürekli bahsetmiş olduğum aslında, eski iş tecrübem de yine bu sıkıntıyı yaşamıştım ben. Bu bölüm aslında daha temiz bir programlama dili nasıl oluyor çok güzel bir şekilde gösteriyor. Ancak günün sonunda biz buna ne kadar erişebiliyoruz ne kadar çevik oluyoruz daha doğrusu o gerçekten tartışılır. Bazen sistemler o kadar karmaşık kuruluyor ki, orada çalışan yazılımcıların, uzman yazılımcıların gerçekten bir sorgulanması gerekmektedir. Bunlar ne yapıyor, ne iş ediyor, neden böyle bir kod yazmışlar :(

## Chapter 12 - Emergence

Evet bu bölümde 4 basit tasarım kuralını inceleyeceğiz.

1. Tüm testleri çalıştırmak
2. Tekrarlanmış kodlardan kaçınmak
3. Açık olmak
4. sınıf ve metot sayısında en aza indirgemek

Nedir bu tüm testler

Kağıt üzerinde bir sistemi inşa etmek kolaydır peki onu proje geçirmekte de bu koalylık sağlanabiliyor mu? Bunu öğrenmenin en kolay yolu, sistem üzerinde testler yazmaktadır. Bu testleri de sistemin tamamına uygulanan bir proje, test edilebilir bir projedir. Test edilebilir demek, projenin aynı zamanda doğrulanabilir olması da demektir. Doğrulanamayan bir sistem ya da proje asla dağıtılmamalıdır yani deploy edilmemelidir.

SRP'ye yani Single Responsibility Principle olayına uyan kodlar yazmak daha kolay test etmeyi sağlamaktadır. Tabi bu durumda doğrulanabilir bir sistem inşa etme de daha kolay olmaktadır. Kodlar arasında bağımlılıklar kurmak kod yazmayı zorlaştırır. Dependency Injection yani bağımlılık enjeksiyonu gibi arayüz ve soyutlamalar konularında bazı toollar kullanılırız. Amacımız bu bağımlılıkları azaltmaktır. Böylece daha iyi tasarımlar ortaya koyabilmekteyiz.

Düzenlemelerimizi yaparken, temiz tasarım hakkında tüm bildiklerimizi uygularız: birbirine bağlılığı (cohesion) artırırız, bağımlılığı (coupling) azaltırız, meselelerin ayrımını (seperation of concerns) sağlarız, sistemlerimizi modülarize ederiz, fonksiyon ve sınıflarımızı küçültür ve daha iyi isimler seçeriz. Burası ayrıca basit tasarımın son üç kuralını uyguladığımız yerdir: tekrarları kaldır, kodunun açıklayıcı olduğundan emin ol, sınıf ve metot sayılarını en aza indir.

İkinci kuralımız da bahsedilen tekrarlanmış kodlar nedir?

Tekrarlanmış kodlar, iyi tasarlanmış sistemlerin birinci düşmanıdır. Tekrarlanmış kodlar, ek iş, ek risk ve gereksiz karmaşa demektir. Örneğin bir liste sınıfındaki şu iki metota bakalım:

Zaten bu zamana kadar yazılan hemen hemen her konu başlığında bu bölüme değinildiği için geçiyorum.

Üçüncü kuralımız Açıklayıcı olmak nedir

Bir yazılım projesinin maliyetinin çoğu uzun dönem bakımıdır. Kodumuzu değiştirirken hata potansiyelini en aza indirgemek için, sistemin ne yaptığını anlamamız önemlidir. Sistemler daha karmaşık hale geldikçe, yazılımcılar olarak anlamamız zorlaşır ve hata yapma riskimiz artar. Bu nedenle, kodumuz yazanın niyetini açıkça belli etmelidir. Yazar kodu daha da açık hale getirdikçe, diğerlerinin anlaması için geçen süre ve bakım süresi daha da azalır.

İyi isimler seçerek kendinizi daha iyi ifade edebilirsiniz. Ayrıca küçük fonksiyon ve sınıfların isimlendirmesi, anlaşılması ve yazılması daha kolaydır.

Standart bir terminoloji kullanarak da kendinizi ifade edebilirsiniz. Örneğin tasarım desenleri (design patterns) büyük ölçüde iletişim ve ifade etme ile alakalıdır. Bu desenleri gerçekleştiren sınıfların isimlerinde bu tür standart desen isimleri kullanarak, Command veya Visitor gibi, tasarımınızı diğer geliştiricilere kısaca açıklayabilirsiniz.

İyi yazılmış birim testleri de açıklayıcıdır. Testlerin öncelikli amacı, örnek dokümantasyon sağlamaktır. Testlerimizi okuyan biri sınıfın neyle ilgili olduğunu hızlı bir şekilde anlayabilmelidir.

Bir şirkette şunu çok iyi biliyorsunuz ki, önceki yazılımcı olmak diye bir kavram vardır. Eğer siz de bir iş yerinden ayrılırsanız, sizin yerinize gelecek kişi sizden önceki yazılımcı olarak bahseder. Eğer siz kendinize güvenerek bazı kodlar yazdıysanız, o zaman arkanızdan iyi bir şekilde anarlar eğer durum tam tersiyse işte o zaman işler değişir. İşte o zaman durumlar kötüye gider. Kulağınız çınlar be!

Siz siz olun işinizi ciddiye alarak yapın. Daha iyi isimler seçin, büyük fonksiyonları daha küçük hale getirin. Özen gösterin işinize. Hadi kolay gelsin :)

Son olarak dördüncü kuralımız, Sınıf ve metot sayısını azaltmak

Evet bunu aslında yukarıda kodlarınızın açıklayıcı olması kuralında sizlere bahsetmiştim. Aslında bu 4 başlık birbirini gerçekten tamamlar türünde. Eğer sizin kodunuzda sınıf sayısı gereksiz yere fazlaysa, eğer metot sayınız gereksiz yere fazlaysa işte o zaman ne açıklayıcı olur kodunuz ne temiz olur kodunuz. Anca bir birini tekrarlamış onlarca kod, karman çurman kodlar olmuş demektir.

Yüksek sayıda sınıf ve metot bazen anlamsız dogmatikliğin bir sonucudur. Örneğin, her sınıf için bir arayüz oluşturmayı ısrarla vurgulayan bir kodlama standardını veya alanların (fields) ve davranışların her zaman veri sınıflarına ve davranış sınıflarına ayrılması gerektiğinde ısrarcı olan geliştiricileri düşünelim. Bu tür dogmalara karşı direnilmeli ve daha pragmatik bir yaklaşım benimsenmelidir.

Şimdi şöyle bir şey var tabi. Bu kural belki de diğer üç kuraldan sonra gelen gerçekten dördüncü kuraldır. O kadar da önemli değil esasında. Neden mi? Çünkü diğer üç madde yazmaya çalışırken sınıf sayınız fazla mı oldu hiç gerek yok kalsın. Testler yazmak, tekrarları ortadan kaldırmak bunlar daha önemli şeyler. Bu yüzden sınıf ve fonksiyon sayısını düşük tutmak önemli olsa da, testler yazmak, tekrarları ortadan kaldırmak ve kendimizi açıkça ifade etmek daha önemlidir.

## Chapter 13 - Concurrency

Eşzamanlılık ilkesi. Bazen bu durum karmaşık hale gelebiliyor. Evet thread li bir iş yapmak belki çoğu zaman daha kolay olmaktadır ancak bazen de Eş zamanlılık olaylarına girmemiz gerekmekte olabiliyor. İşte bizler de bu konu başlığında bu durumu ele alacağız.

Ancak bu bölümden sonrası biraz kod dünyasından çıkmaktadır. Burası biraz daha İşletim Sistemleri tarafına kaymaktadır. Kitabın bundan sonrasını ben biraz daha işletim sistemleri dersiyle özdeşleştirdim doğrusu.

Eşzamanlılık bir ayrıştırma stratejisidir. Neyin yapıldığını ne zaman yapıldığını ayırmamıza yardımcı olur. Neyi ne zaman ayırmak, bir uygulamanın hem verimini hem de yapısını önemli ölçüde iyileştirebilir. Yapısal bir bakış açısından, uygulama tek bir büyük ana döngüden çok, işbirliği yapan birçok küçük bilgisayar gibi görünür. Bu, sistemin anlaşılmasını kolaylaştırabilir ve endişeleri ayırmak için bazı güçlü yollar sunar.

Aynı anda bir kullanıcıyı yöneten ve kullanıcı başına yalnızca bir saniyelik süre gerektiren bir sistemi düşünün. Bu sistem, birkaç kullanıcı için oldukça duyarlıdır, ancak kullanıcı sayısı arttıkça sistemin yanıt verme süresi de artar. Hiçbir kullanıcı 150 kişinin arkasında sıraya girmek istemez! Birçok kullanıcıyı aynı anda ele alarak bu sistemin yanıt süresini iyileştirebiliriz. Ya da büyük veri kümelerini yorumlayan ancak hepsini işledikten sonra tam bir çözüm sağlayabilen bir sistem düşünün. Belki de her veri seti farklı bir bilgisayarda işlenebilir, böylece birçok veri seti paralel olarak işlenir.

Eşzamanlılık ilkeleri:

1. Eşzamanlılık her zaman performansı artırır.
2. Eşzamanlı programlar yazarken tasarım değişmez.
3. Eşzamanlılık sorunlarını anlamak, Web veya EJB kapsayıcısı gibi bir kapsayıcıyla çalışırken önemli değildir.
4. Eşzamanlılık, hem performansta hem de ek kod yazmada bazı ek yüklere neden olur.
5. Doğru eşzamanlılık, basit problemler için bile karmaşıktır.
6. Eşzamanlılık hataları genellikle tekrarlanabilir değildir, bu nedenle gerçek kusurlar yerine genellikle tek seferlik hatalar olarak görmezden gelinirler.
7. Eşzamanlılık genellikle tasarım stratejisinde temel bir değişiklik gerektirir

Eşzamanlılık Savunma İlkeleri

Single Responsibility Principle - SRP, belirli bir yöntemin/sınıfın/bileşenin değişmek için tek bir nedeni olması gerektiğini belirtir. Eşzamanlılık tasarımı, başlı başına bir değişiklik nedeni olacak kadar karmaşıktır ve bu nedenle kodun geri kalanından ayrılmayı hak eder.

Corollary: Limit the Scope of Data - Paylaşılan bir nesnenin aynı alanını değiştiren iki iş parçacığı birbirini engelleyerek beklenmedik davranışlara neden olabilir. Bir çözüm, paylaşılan nesneyi kullanan koddaki kritik bir bölümü korumak için synchronized anahtar sözcüğünü kullanmaktır.

Corollary: Use Copies of Data - Paylaşılan verilerden kaçınmanın iyi bir yolu, en başta verileri paylaşmaktan kaçınmaktır. Bazı durumlarda nesneleri kopyalamak ve onları salt okunur olarak değerlendirmek mümkündür. Diğer durumlarda, nesneleri kopyalamak, bu kopyalarda birden çok diziden sonuç toplamak ve ardından sonuçları tek bir dizide birleştirmek mümkün olabilir.

Gelişmiş eşzamanlılık tasarımını desteklemek için eklenen birkaç başka sınıf türü vardır. İşte birkaç örnek:

|--|--|
|---|---|
|ReentrantLock|A lock that can be acquired in one method and released in another.|
|Semaphore|An implementation of the classic semaphore, a lock with a count.|
|CountDownLatch|A lock that waits for a number of events before releasing all threads waiting on it. This allows all threads to have a fair chance of starting at about the same time.|

Know Your Execution Models

Bound Resources: Eşzamanlı bir ortamda kullanılan sabit boyuttaki veya sayıdaki kaynaklar. Örnekler, veritabanı bağlantılarını ve sabit boyutlu okuma/yazma arabelleklerini içerir.

Mutual Exclusion: Paylaşılan verilere veya paylaşılan bir kaynağa aynı anda yalnızca bir iş parçacığı erişebilir.

Starvation: Bir iş parçacığının veya bir grup iş parçacığının aşırı uzun bir süre veya sonsuza kadar ilerlemesi yasaktır. Örneğin, her zaman hızlı akan iş parçacıklarının önce geçmesine izin vermek, hızlı akan iş parçacıklarının sonu yoksa daha uzun süren iş parçacıklarını aç bırakabilir.

Deadlock: Birbirini bitirmeyi bekleyen iki veya daha fazla iş parçacığı. Her iş parçacığının, diğer iş parçacığının gerektirdiği bir kaynağı vardır ve hiçbiri diğer kaynağı alana kadar bitiremez.

Livelock: Her biri iş yapmaya çalışan, ancak "yolda" başka bir tane bulan, birbirini takip eden iplikler. Rezonans nedeniyle, ileti dizileri ilerleme kaydetmeye devam eder, ancak çok uzun bir süre veya sonsuza kadar ilerleme kaydedemez.

Producer-Consumer

Bir veya daha fazla üretici iş parçacığı bazı işler yaratır ve onu bir ara belleğe veya kuyruğa yerleştirir. Bir veya daha fazla tüketici iş parçacığı, bu işi kuyruktan alır ve tamamlar. Üreticiler ve tüketiciler arasındaki kuyruk bağlı bir kaynaktır. Bu, üreticilerin yazmadan önce kuyrukta boş alan beklemesi ve tüketicilerin kuyrukta tüketecek bir şey olana kadar beklemesi gerektiği anlamına gelir. Sıra yoluyla üreticiler ve tüketiciler arasındaki koordinasyon, üreticilerin ve tüketicilerin birbirlerine sinyal vermesini içerir. Üreticiler kuyruğa yazar ve kuyruğun artık boş olmadığının sinyalini verir. Tüketiciler kuyruktan okur ve kuyruğun artık dolu olmadığının sinyalini verir. Her ikisi de potansiyel olarak devam edebilecekleri zaman bilgilendirilmeyi bekler.

Readers-Writers

Öncelikle okuyucular için bir bilgi kaynağı olarak hizmet eden, ancak yazarlar tarafından zaman zaman güncellenen paylaşılan bir kaynağınız olduğunda, verim bir sorundur. İş hacmini vurgulamak, aç kalmaya ve eski bilgilerin birikmesine neden olabilir. Güncellemelere izin verilmesi verimi etkileyebilir. Okuyucuları, bir yazarın güncellediği bir şeyi okumamaları için koordine etmek ve bunun tersi, zorlu bir dengeleme eylemidir. Yazarlar, birçok okuyucuyu uzun süre bloke etme eğilimindedir, bu da verim sorunlarına neden olur.
Buradaki zorluk, hem okuyucuların hem de yazarların ihtiyaçlarını, doğru çalışmayı tatmin etmek, makul verim sağlamak ve açlıktan kaçınmak için dengelemektir. Basit bir strateji, yazarların güncelleme yapmasına izin vermeden önce hiç okuyucu kalmayana kadar beklemelerini sağlar. Ancak sürekli okuyucular varsa, yazarlar aç kalacaktır. Öte yandan, sık yazanlar varsa ve onlara öncelik verilirse, verim düşecektir. Bu dengeyi bulmak ve eşzamanlı güncelleme sorunlarından kaçınmak, sorunun ele aldığı şeydir.

Dining Philosophers

Dairesel bir masanın etrafında oturan birkaç filozof düşünün. Her filozofun soluna bir çatal konur. Masanın ortasında büyük bir kase spagetti var. Filozoflar, acıkmadıkça, düşünerek vakit geçirirler. Acıktıklarında iki yanlarındaki çatalları alıp yemek yerler. Bir filozof iki çatal tutmadıkça yemek yiyemez. Sağındaki veya solundaki filozof ihtiyacı olan çatallardan birini zaten kullanıyorsa, o filozof yemeğini bitirip çatalları geri bırakana kadar beklemelidir. Filozof bir kez yemek yer, iki çatalını da masaya koyar ve tekrar acıkmasını bekler.

Senkronize Yöntemler Arasındaki Bağımlılıklara Dikkat Edin

Paylaşılan bir nesne üzerinde birden fazla method kullanmaktan kaçının. 3 sebebi var:

Client-Based Locking - İstemcinin ilk yöntemi çağırmadan önce sunucuyu kilitlemesini sağlayın ve kilidin kapsamının son yöntemi çağıran kodu içerdiğinden emin olun.

Server-Based Locking - Sunucu içinde, sunucuyu kilitleyen, tüm yöntemleri çağıran ve ardından kilidi açan bir yöntem oluşturun. İstemcinin yeni yöntemi çağırmasını sağlayın.

Adapted Server - Kilitlemeyi gerçekleştiren bir aracı oluşturun. Bu, orijinal sunucunun değiştirilemediği sunucu tabanlı kilitlemeye bir örnektir.

Synchronized Sections Should be Small

Bu bölümler kritiktir ve bir şeyler ters giderse bakımı zordur, bunları küçük ve basit tutmalısınız. Birçoğuna sahip olmak daha iyidir, ancak çok büyük yerine küçük.

Thread kodları test etme

1. Sahte başarısızlıkları aday thread sorunları olarak ele alın.

2. Önce thread olmayan kodu çalıştır.

3. Thread kodu takılabilir hale getirin.

4.Thread'i kodu ayarlanabilir yapın.

5. İşlemciden daha fazla thread çalıştırın.

6. Farklı platformlarda çalıştırın.

7. Hataları denemek ve zorlamak için kodunuzu kullanın. 

Hand-Coded

Kodda bir sorun olduğunu ya da olabileceğini bildiğiniz bir bölümü test ederken, koda uyku ekleme vs. oalyıdır. Eğer başarısız olursa bir şey, bu sizin eklediğiniz uykudan vs. değil zaten sorundan kaynaklanmaktadır.

Automated

Belirli bir yöntemde veya alınan parametrelerde koda rastgelelik ekleyen yöntemler oluşturabilirsiniz.

Bölüm Sonu

Doğal olarak şu soruyu sizde kendinize soruyorsunuz eminim. Chapter chapter okurken ne güzel Clean Code'dan konuşuyorduk ne ara konu Thread'lere geldi ne ara konu işletim sistemlerine geldi. Valla ben de aynı fikirdeyim. Eğer siz böyle düşümüyorsanız muhtemelen şuan bana kızıyorsunuz demektir. Abi yapacak bir şey yok, beni pas geç şuan :(

## Chapter 14 - Successive Refinement

İlk önce kelime anlamları ile olaya başlayalım. 

Refirement: Bir maddeden safsızlıkları veya istenmeyen elementleri çıkarma işlemi.

impurities: Saf olma durumu

örnek, basit parser class gibi görünüyor, argüman olarak bir dizi alın ve iş gereksinimleri dize, boolean ve integer ile ilgili veri türleri üretmek için onu ayrıştırın. Yazar ayrıca istisnaları işlemek için özel ArgsException uygular. Args sınıfından ayrıştırılmış verileri almak için getBoolean, getString, getInteger yöntemleri var, Intent, Bundle, Cursor ex'den verileri nasıl alıyoruz gibi görünüyor.

***Kirli kodla başlamak ve ardından temizlemek mümkündür. Buradaki temizlik adımı bir zorunluluktur!***

Meşhur bir söz var İngilizce: **Programming is not a science. Programming is a craft.** Zaten sırf bu yüzden ben üniversiteye barınamadım. Bize bilim bu bilim diye hep dayattılar yapay zeka cart curt ama iOS & Android programlama bildiğin craft yani zanaat işi hocam. Ha iOS mühendisleri, Android mühendisleri onlara baş üstüne. Onlar mühendisler. Ancak biz onların ürettiklerini kullanıyoruz sadece. Neyse konuyu dağıtmayım çok fazla ama kıssadan hisse hocam, bu zanaat işinde amaç kodu temiz tutmak ve kirli kodu temize çekmek.

Bu noktada, yeni özellik eklemeyi bırakın ve yeniden düzenlemeye başlayın diyor. Bu nokta çok önemlidir, kötü çalışan bir kod vardır ve programcı kodun dağınık olduğunu hisseder. Hatalı kodun yeniden düzenlenmesi gerekiyor. Ancak bir sorun var, yeniden düzenlemeden sonra tüm programlar aynı şekilde çalışmıyor. Yeniden düzenleme, özelliklerin çökmesine veya bozulmasına neden olabilir. Bundan kaçınmak için TDD'ye ihtiyacımız olduğunu söylüyor. Örneği TDD'ye göre refactor ediyor, zaten yazılı testler var ve basit artışlarla gidiyor. Her zaman testlerin geçtiğinden emin olmaya çalışır ve sistemi her zaman çalışır durumda tutar.

![image](https://user-images.githubusercontent.com/56068905/205517331-fa97b732-9a13-47fc-9551-3c409d9d2635.png)

Kodunuzu her zaman sanki arkanızdan gelen geliştirici, nerede yaşadığınızı bilen şiddet yanlısı bir psikopatmış gibi yazın. TDD, kodumuzu daha sürdürülebilir, daha kolay anlaşılır hale getirir. Yani TDD ile temiz kod arasında bir birliktelik olduğunu söyleyebiliriz.

## Chapter 15 - JUnit Internals

Bu bölüm biraz daha JUnit temelleri hakkında olacak direk JUnit ile ilgili değil ya da TDD ile ilgili değil.

Tahmin edebileceğiniz gibi, refactoring işlemine başlamadan önce ComparisonCompactor sınıfının refactoring işlemi için hayati önem taşıyan %100 test kapsamına sahip olduğunu söylüyor. Yazar diyor ki, refactoring yaptığım kodların %0 seviyesi test yazanlarmış. Yani test yazan insan refactoringe ihtiyaç duymazmış. Meselenin özü bu. Yeniden düzenleme, yazılım geliştirmede sıklıkla kullanılan ve saygı duyulan bir kelimedir. Saygın geliştiricileri genellikle ulaşılması imkansız olarak gördükleri için. Kendilerine güvenmiyorlar. Nothing is perfect. Hiçbir şey mükemmel değildir.

Refactoring i eğer bir takım halinde yaparsanız, ekip içerisinde birbirine yardım eder olmak birbirinin kodlarını temize daha iyi oluşturmak demektir. Eğer bu yardımcılık olursa sadece bireyler değil tüm takım kazanır.

## Chapter 16 - Refactoring SerialDate

SerialDate sınıfı profesyonelliği ve disiplini içinde barındırır. Bu bir iyi kod olarak gözükebilir. Her kodun bir sorunu vardır.. Başka bir kişinin kodunu inceleyip hata bulmanın bir hiyerarşi göstergesi olmadığını belirtiyor.

Kod inceleme sürecinin nazik ve profesyonelce yapılması gerektiğini belirtiyor. Ayrıca her geliştirici kod incelemelerine açık olmalıdır.

Önce birim test kapsamı kontrol edilir. Ardından kodu iyi anlamak ve kapsamı artırmak için birim testler yazılır. Bazıları yorumlanır bazıları yeniden düzenlenir. Test uygulaması bittikten sonra ilk kapsam yüzde 50 iken sonrasında yüzde 92 olmakta ise, orada başarı söz konusudur.

Refactoring Approaches

* Yalnızca testten kullanılan kod varsa testi ve kodu birlikte silin.
* Algoritmalar biraz karmaşıksa, GEÇİCİ DEĞİŞKENLERİ AÇIKLAMA yaklaşımını kullanmayı deneyin. Bu yaklaşım, uygulama hakkında daha fazla ayrıntı açıklamak için geçici değişkenler kullanır.
* Enum`lar oldukça büyükse, onu başka bir sınıfa taşıyın. Ve enums içinde gerekli yöntemleri uygulayın.
* Birden çok if ifadesini || kullanarak tek bir if ifadesine bağlayın. ve && operatörleri.
* Sabit statik tamsayıları numaralandırmaya dönüştür. (Bu, Android için kötü olabilir)
* IDE'nin gücünü kullanın. Değişkenlerin ve yöntemlerin kullanımlarını kontrol edin ve adlarını IDE yardımıyla değiştirin.
* Değişken adları yeterliyse yorumları silin. Değilse, değişkenleri ve yöntemleri yeniden adlandırın.
* Ad yöntemleri ve değişkenler anlamlı.
* Temel sınıfların türevlerini bilmesi genellikle kötü bir fikirdir. Bunu düzeltmek için, ABSTRACT FACTORY kalıbını kullanın ve fabrikadan örnek oluşturun.
* Değişiklik geçmişini sınıfın en üstünden silin çünkü sürüm kontrol araçlarını kullandığımız için önemli değil.
* Kaynak kodunda birden fazla dil olması sıkıntı yaratıyor. Javadocs'tan html kodlarını kaldırın.
* Neden sorularıyla anlamaya çalışın.
* Sabitleri olan sınıflardan miras almak, Java programcılarının MonthConstants.January gibi ifadeleri kullanmaktan kaçınmak için kullandıkları eski bir hiledir, ancak bu kötü bir fikirdir.
* Gereksiz yorumlar, yalnızca yalan ve yanlış bilgi toplamak için kullanılan yerlerdir. Onlardan kurtulmak.
* Bazı geleneksel bilgelik karşısında son sinekleri ortadan kaldırmak. Örneğin, Robert Simmons bize “. . . finali kodunuzun her yerine yayın." Açıkçası katılmıyorum. Ara sıra son sabiti gibi final için birkaç iyi kullanım olduğunu düşünüyorum, ancak bunun dışında anahtar kelime çok az değer katar ve çok fazla karmaşa yaratır.
* Bir yöntemi diğerinden yalnızca bayrakla çağırmak genellikle kötü bir uygulamadır. Gerekirse bayrak geçirmek yerine farklı yöntemler yapın.

Daha sonra class boyutu küçülüyor böyle test edilebilirlik oran yüzde 85e kadar çıokıyor. bu gayet güzel.

***Bu koda bakacak bir sonraki kişi, umarız onunla bizim yaptığımızdan daha kolay başa çıkacaktır. Bu koda bakacak bir sonraki kişi, umarız onunla bizim yaptığımızdan daha kolay başa çıkacaktır.***


# Son Olarak

Uzun olan bir kitabın sonuna gelmiş olmaktayım. Son Appendix A-B-C taraflarıyla ilgili yazacak bir şey bulamadım doğrusu. Önemli olan 16 bölümün özeti işte bu şekildedir. Ben buraya tabi bir şeyler karaladım ama en güzeli gerçekten kitabı normal satın alıp başucu kitap haline getirmek gerekmektedir. Böyle PDF ortamında pek olmuyor bunlar. Bir de, bu kitap sayesinde gerçekten insanın yazılıma bakış açısı değişiyor. Bu açıdan yazara ne kadar teşekkür etsek azdır. Ancak bence burada yaşanılanları okul zamanında öğrencinin öğrenmesi gerekenler olarak değil de, baya baya iş hayatı tecrübesinde yaşamak gerektiğiymiş. Hal böyle olunca bazı şeyler çok sözel kalıyor. Ancak inanıyorum ki, kısa sürede olsa iş hayatı görmüş bir insanın, bu kitabı nasıl da başucu kitabı yapacağını çok iyi anlıyorum. Bu kitabı bize şuan Kaan Yıldırım hocamız verdi. Kendisine bir kez daha teşekkür etmek istiyorum burada çünkü bu Bootcamp süresince bu ktiaplar bizlere çok şey kazandırdı. Benim eski iş tecrübem de olunca bu kitaplar daha bi anlam kazandı. Kaan hocamızın başucu kitapları bir hayli fazla. Ben şuan Junior bir yazılımcıyım. Gün gelecek bende bir iOs developer olacağım ve o zaman da gerçek te isteklerim, arzularım, hayallerim tamamen bu kitap gibi başucu kitaplar alıp kendimi geliştirmek olacak. Arkadaşlar, senior seviyede bir projeyi baştan inşa ederek kurmak kolay bir şey değil. Bir mimari oluşturup tüm ekibe bunu kullanacağız demek kolay bir şey değil. Dolayısıyla, burada yazılanları zamanla iş hayatında tecrübe etmek bizim için elmas değerinde. Bir de iş hayatında görüyoruz ki, burada yazılanlarda pek uyulmuyor. Ancak yine de biz burada yazılanları okumak durumundayız eğer biz iyi bir yazılımcı olmak istiyorsak bizim okumamız gerekmektedir.
