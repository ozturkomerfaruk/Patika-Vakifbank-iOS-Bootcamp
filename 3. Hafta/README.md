# 3. Hafta

**AppDelegate** dosyasında third party bir kütüphane ekleneceği zaman buraya eklenmektedir. didFinishLauncingWithOptions metounda ekleniliyor.

**SceneDelegate** Appdelegate gibi çalışıyor. Ancak mesela tablette aynı uygulama iki kez açılıyor aynı anda. Sağda ya da solda ne gözükmesi lazım sorusunun cevabı burada gideriliyor.

<img width="300" src="https://user-images.githubusercontent.com/56068905/202358205-d6f63de6-267d-4e2f-863b-4ee0013cf3ff.png">

Sırayla label, button, segmented Control, textField, slider, switch ve view kullanılmıştır.

Öncelikle, view'a tıklama özelliği kazandırmak için, şu satırlar yazılabilir.

```
myView.backgroundColor = .green
myView.isUserInteractionEnabled = true
let gesture = UITapGestureRecognizer(target: self, action: #selector(labelChange))
myView.addGestureRecognizer(gesture)
```

Birden fazla buton olduğu zaman tag ile haberleşme sağlanabilir

```
@IBAction func myButton(_ sender: UIButton) {
    if sender.tag == 1 {
        print("Button")
    }
}

@IBAction func tag2Button(_ sender: UIButton) {
    if sender.tag == 2 {
        print("tag2")
    }
    print(textField.text!)
}
```

segmentedControl de, switch de, slider da değere erişmek için value kullanılıyor. Fonksiyonlarının içerisinde şöyle yazılabilir:

```
let str = (sender as! UISegmentedControl).selectedSegmentIndex
print(str)

print((sender as! UISlider).value)
print((sender as! UISwitch).isOn)
```

LifeCycle olarak 

* viewWillAppear
* viewDidAppear
* viewWillDisappear
* viewDidDisappear

Ancak bazen mülakatlarda, bir ViewController açılırken ilk nereler çalışır diye sorulduğunda, verilmesi gereken en uygun cevap şu şekilde olabilirmiş. Bunu bir arkadaşımız mülakat sürecinde yaşamış.

İlk olarak init() çalışır daha sonra LoadView çalışır. Sonrasında viewDidLoad Daha daha sonrasında da yukarıda bahsedilen Lifecycle metotları gelir.

LoadView aslında şu demektir: Eğer view’ı storyboard kullanarak oluşturduysanız bu metodu kullanmanıza gerek yok. Ancak view’ı kod yazarak oluşturduysanız viewDidLoad() yerine bu metodu kullanabilirsiniz.


## Table

<img width="300" src="https://user-images.githubusercontent.com/56068905/202368910-2210b0c5-ec5d-4f3e-87ba-1bd02cddcbcf.png">

delegate ve dataSource bulunmaktadır. Delegate ve dataSource ile, table'ın nasıl gözükmesi gerektiğine, rengine, kaç adet olmasına vs. buradan karar vermekteyim.

Delegate için

```
extension BasicTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
```

Data Source için

```
extension BasicTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        
        return cell
    }
}
```

Not: Sadece table olan sayfalarda TableViewController kullanmak yanlış oluyor. Bazı kısıtlamalar var bundan dolayı kabul etmiyor. CustomCell mesela yapamıyorsun, gibi.

## CustomCell oluşturalım

<img width="300" src="https://user-images.githubusercontent.com/56068905/202373614-5dd6a0c0-2b85-4de3-ba45-d40b950ed405.png">

bu ekran görüntüsünde ki gibi bir custom cell oluşturmak için Xib ile birlikte UICustomCellView oluşturacağız. Orada istediğimiz gibi label vs. ekleyebiliyoruz.

<img width="400" alt="image" src="https://user-images.githubusercontent.com/56068905/202373852-d0c7a960-96f6-4eed-b9bb-4b44e3b12ba3.png">

Eklenen bu Custom Cell TableView'a register edilmesi gerekmektedir.

```
customCellTable.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
```

farzedelim ki bir tane daha cell var. Guard let kullanıcaz. Identifier kısmında

```
guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? TableViewCell else {
    return UITableViewCell()
}
cell.nameLabel.text = items[indexPath.row].name
cell.countLabel.text = String(items[indexPath.row].count)
return cell
```

