# 3. Hafta

## Basic Components

## Table

## Custom Cell Table

## Collection View

## Nav Controller - Search Bar

## [Stack View](https://github.com/ozturkomerfaruk/Patika-Vakifbank-iOS-Bootcamp/tree/master/3.%20Hafta#stackview)

## Nav Controller - Segue

## User Default - Keychain

## API

----------------------------------------------------------------

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

Çok sık kullanılan yapılardan biridir. Form ekranları için birebir.



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


# Table

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

<h1 id="CustomCell">CustomCell oluşturalım</h1>

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

# Collection View

<img width="300" src="https://user-images.githubusercontent.com/56068905/202381134-af574475-5321-40e3-b3db-ccd69739fcae.png">

Tableview ile bire bir mantığı var. Hiçbir fark yok, custom cell oluşturmadan:

yine delegate, datasource 

```
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
    cell.configure(model: items[indexPath.row])
    return cell
}
```

Sadece önemli not: Cell'i Xib ile açmasanda cell'e erişirken private weak olarak oluştur. Table'da deneme içindi

```
@IBOutlet private weak var name: UILabel!
@IBOutlet private weak var count: UILabel!

func configure(model: ItemModel) {
    name.text = model.name
    count.text = String(model.count)
}
```

# Nav Controller ile Search Bar

```
let search = UISearchController(searchResultsController: nil)
search.searchResultsUpdater = self
search.searchBar.placeholder = "Type something"
navigationItem.searchController = search
```

```
extension BasicTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
        items = itemToShow.filter({ $0.name.lowercased() == text.lowercased() })
        if text == "" {
            items = itemToShow
        }
        basicTable.reloadData()
    }
}
```
# Stack View

Tabi bunları yazmadan önce, TableView'da kullanılan bir dizimiz var. Daha sonra bir tane de boş oluşturup, boş diziye bunu atadıktan sonra, yukarıda ki fonksiyonda kullanıyoruz.

<img width="300" src="https://user-images.githubusercontent.com/56068905/202452900-f66d6ea4-302d-4974-8e7d-cc59f76924a4.png">

Ayrı kod olarak sunulacak bir detay yok burada. Burada dizilenler bir Stack içerisinde bulunuyorlar. Biri isHidden olursa yerin başkası geçiyor. Tipik login / signup sayfaları için birebir gibi duruyor.

# Nav Controller - Segue

<img width="588" alt="image" src="https://user-images.githubusercontent.com/56068905/202471186-6ac306a4-d2d7-4239-923c-7e7471bb9434.png">

Böyle bir bağlılık var. eğer ID ile geçiş yapacaksak:

```
@IBAction func pushPressed(_ sender: Any) {
    guard let pushWithIdVC = storyboard?.instantiateViewController(withIdentifier: "NextScreenVC") as? NextScreenViewController else { return }
    pushWithIdVC.pushedData = "Ömer"
    self.navigationController?.pushViewController(pushWithIdVC, animated: true)
}
```

Segue ile geçiş yaparken

```
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueVC" {
        guard let vc = segue.destination as? SegueViewController else { return }
        vc.segueStr = "Ömer Faruk"
    }
}
```

Tabi bunların storyboard ID'leri vermeyi unutma


# User Default

<img width="176" alt="image" src="https://user-images.githubusercontent.com/56068905/202485555-44267ce2-180b-4b4e-a0c9-9d59e9bb4907.png">

Okurken

```
let userDefaultString = UserDefaults.standard.value(forKey: "UserDefaultValue")
        
userDefaultValue.text = userDefaultString as? String
```

Yazarken

```
@IBAction func SaveUserDefault(_ sender: Any) {
    UserDefaults.resetStandardUserDefaults()
    UserDefaults.standard.set(textField.text!, forKey: "UserDefaultValue")
    print(textField.text!)
}
```


# Keychain

[installain için](https://github.com/kishikawakatsumi/KeychainAccess#installation)

paketi yükledikten sonra

```let keychain = Keychain(service: "com.ozturkomerfaruk.thirdWeek")```

```keychainAccessValue.text  = keychain["keychainDeneme"]```

```keychain["keychainDeneme"] = textFieldKeyChain.text```

Daha kolay, daha güvenilir 😊🥸

# API

[WizardWorldAPI'da Spells Get metodunu kullanacağım](https://wizard-world-api.herokuapp.com/swagger/index.html)

## Client Class

<img width="568" alt="image" src="https://user-images.githubusercontent.com/56068905/202536248-ecbc0822-bd75-4ad8-bd42-a441c42d4194.png">

<img width="810" alt="image" src="https://user-images.githubusercontent.com/56068905/202536567-a9f24253-e85a-4b55-931c-33902183e4ac.png">

<img width="778" alt="image" src="https://user-images.githubusercontent.com/56068905/202536908-127c8c3c-0567-4e5c-b0cb-79bbb5f2d505.png">

## Base Reponse

<img width="403" alt="image" src="https://user-images.githubusercontent.com/56068905/202536973-2184056e-632b-493d-9fce-c71373def7aa.png">

## Spell Model

<img width="325" alt="image" src="https://user-images.githubusercontent.com/56068905/202537165-46d91bd9-fd04-45b2-9766-09910270e422.png">
