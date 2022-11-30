# 5. Hafta

## 4. Hafta projesine ek olarak eklenen özellikler

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
