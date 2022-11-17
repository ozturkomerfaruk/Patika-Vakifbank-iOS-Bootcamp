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
