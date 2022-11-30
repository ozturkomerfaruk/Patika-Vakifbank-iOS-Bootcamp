# 5. Hafta

## 4. Hafta projesine ek olarak eklenen özellikler

* Yeni bir tab bar sayfası
* Ekran ortasında açılan Xibfile View ile not ekleme özelliği
* Delegate Pattern kullanımı
* CoreData ile ekleme ve çekme işlemi

## Delegate Pattern

4. haftada Xibfile oluşturma işlemine değinilmişti. Buna ek olarak oluşturulan Delegate pattern mantığı

### Hedeflenilen husus: 

ViewControllerda bir Button ve bir de TableView bulunmaktadır. Button ile ekranın tam ortasında bir View açılacak ve orada bulunan TextField ile bir şeyler yazıp, View içerisinde ki Save butonu ile kaydedip VC üzerinde ki TableView'da listelemek.

### Amaç: 

Kaydetme işlemini delegate ile ViewController üzerinde gerçekleştirmek. 

### View'da yapılacak işlemler: 

```
protocol NewNoteViewDelegate: AnyObject {
    func savePressed(input: String)
}
```

### Neden AnyObject?

AnyObject kullanılmasının sebebinde delegate'i tanımlarken weak olarak tanımlayabilmemiz için. Weak referans typler için kullanılıyor. AnyObject bunu sağlıyor.

### Ardından View'ın içerisinde:

```
weak var delegate: NewNoteViewDelegate?

@IBAction func buttonAction(_ sender: UIButton) {
    delegate?.savePressed(input: textView.text)
    print("Save Pressed")
    removeFromSuperview()
}
```

Weak olarak tanımladıktan sonra, delegate fonksiyonunu kaydet butonu içerisinde gerçekleştirebiliyoruz.

### ViewController içerisinde: 

VC içerisinde ki Button Action kısmında delegate'i aktif ediyoruz.

```
newNoteView.delegate = self
```

Ardından extension içerisinde kullanıyoruz.

```
extension NoteViewController: NewNoteViewDelegate {
    func savePressed(input: String) {
        notes.append(CoreDataManager.shared.saveNote(text: input)!)
        self.tableView.reloadData()
    }
}
```

## Core Data yapısına geçmeden önce kullanılan bazı noktalar

1. Custom Cell içerisinde ki, Label'ın maximum size'ını 0 yaptım. TableView'da da şu özelliği ekledim.

```
tableView.estimatedRowHeight = UITableView.automaticDimension
```

Bu TableView'ın Cell'lerinin her bir satırını otomatik size haline getiriyor.

2. View'ın tam ortada çıkmasını sağlayan basit yapı.

```
 @IBAction func buttonAction(_ sender: Any) {
        let newNoteView = NewNoteView(frame: CGRect(origin: CGPointMake(view.center.x - 150, view.center.y - 150), size: CGSize(width: 300, height: 300)))
        newNoteView.alpha = 0
        UIView.animate(withDuration: 1.0) {
            newNoteView.alpha = 1
        }
        newNoteView.delegate = self
        view.addSubview(newNoteView)
    }
```

## Core Data Yapısı

### Eğer hazırda kullanılan projeye sonradan entegre etmek istiyorsak, AppDelegate içerisine:

```
lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataFileName")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
```

## CoreDataManager

CoreData, SQLFlite'ın Apple versiyonudur. Ancak Apple kimliği altında çalışan bu yapı, inanılmaz büyük kolaylıklar sağlamaktadır. Burada oluşturulan bir Entity için daha sonra model oluşturmaya felan gerek kalmadan, direk kullanabilme özelliği sunmaktadır.

```
static let shared = CoreDataManager()
private let managedContext: NSManagedObjectContext!

private init() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    managedContext = appDelegate.persistentContainer.viewContext
}
```

### Save

```
func saveNote(text: String) -> Note? {
    let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)!
    let note = NSManagedObject(entity: entity, insertInto: managedContext)

    note.setValue(text, forKey: "noteText")
    do {
        try managedContext.save()
        return note as? Note
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
    return nil
}
```

### Get


```
func getNotes() -> [Note] {
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
    do {
        let notes = try managedContext.fetch(fetchRequest)
        return notes as! [Note]
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
    return []
}
```
### Delete

```
func deleteNote(note: Note) {
    managedContext.delete(note)

    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}
```

# Agile - Scrum (Acil değil Agile)

* Süreçler ve araçlardan ziyade bireyler ve etkileşimlere
* Kapsamlı dökümantasyondan ziyade çalışan yazılıma
* Sözleşme pazarlıklarından ziyade müşteri ile işbirliğine
* Bir plana bağlı kalmaktan ziyade değişime karşılık vermeye

Süreçler ve araçlar, bir değer üretmek için vardır. Bunlar sadece bir değer üretmek için birer araçtır. Bu değer bireylerin kendi aralarındaki etkileşimi maksimize etmek için vardır.

Dökümantasyon önemli ama öncelik çalışan bir yazılımdır. Dökümantasyonda takımın üretme performansını artırma ve takımın ilerlemesini baz alarak oluşturulması gerekmektedir. Yazılımcıyı yoran bir dökümantasyon vakit kaybıdır.

Kontratlar, sözleşmeler bir proje öncesinde bazen müşteriye karşı güven ortamını zedeleyebilmektedir. Bir anlaşma yaparak tabiki projeye başlamak güzeldir ama yazılım dinamik bir şeydir ve zamanla her şey değişebilir. Bu sebeple burada amaç müşteriye olan güveni maksimum noktaya getirmeye çalışmaktır.

Aynı şekilde bir plan yapmakta güzeldir ama plan demek her şey demek değildir. Müşteri farklı bir şey eklemek isteyebilir belki de istediği bir şeyi kaldırmak isteyebilir. Bu onun en tabi hakkıdır. Bu sebeple dinamik bir yapıya uygun bir çalışma prensibi belirlemek gerekmektedir.

## Prensipler

* En önemli önceliğimiz değerli yazılımın erken ve devamlı teslimini sağlayarak müşterileri memnun etmektir.
* Değişen gereksinimler yazılım sürecinin son aşamalarında bile kabul edilmelidir. Çevik süreçler değişimi müşterinin rekabet avantajı için kullanır.
* Çalışan yazılım, tercihen kısa zaman aralıkları belirlenerek birkaç haftada ya da birkaç ayda bir düzenli olarak müşteriye sunulmalıdır.
* İş süreçlerinin sahipleri ve yazılımcılar proje boyunca her gün birlikte çalışmalıdırlar.
* Projelerin temelinde motive olmuş bireyler yer almalıdır. Onlara ihtiyaçları olan ortam ve destek sağlanmalı, işi başaracakları konusunda güven duyulmalıdır.
* Bir yazılım takımında bilgi alışverişinin en verimli ve etkin yöntemi yüzyüze iletişimdir.
* Çalışan yazılım ilerlemenin birincil ölçüsüdür.
* Çevik süreçler sürdürülebilir geliştirmeyi teşvik etmektedir. Sponsorlar, yazılımcılar ve kullanıcılar sabit tempoyu sürekli devam ettirebilmelidir.
* Teknik mükemmeliyet ve iyi tasarım konusundaki sürekli özen çevikliği artırır.
*  Sadelik, yapılmasına gerek olmayan işlerin mümkün olduğunca arttırılması sanatı, olmazsa olmazlardandır.
*  En iyi mimariler, gereksinimler ve tasarımlar kendi kendini örgütleyen takımlardan ortaya çıkar.
*  Takım, düzenli aralıklarla nasıl daha etkili ve verimli olabileceğinin üzerinde düşünür ve davranışlarını buna göre ayarlar ve düzenler.

# Scrum

Agile metodolojisi yukarıda anlattıklarımdır. Scrum'da bunun bir framework halidir. Farklı bir framework teknikleri de var. Ancak en kullanılanı Scrumdır. Bunun da bazı rolleri vardır.

* Product Owner         - Yöneticidir.
* Development Team      - Yazılım ekipleri
* Scrum Master          - Her ekibin Scrum lideri

Toplantılar

* Sprint Planning       - Backlog toplantılarıdır.
* Daily Scum            - Dün ne yaptım, bugün ne yaptım, beni engelleyen bir durum var mı
* Sprint Review         - En son Product Owner ile olan toplantı
* Sprint Retrospective  - Neler iyi gitti, neler kötü gitti, neleri değiştirebiliriz

