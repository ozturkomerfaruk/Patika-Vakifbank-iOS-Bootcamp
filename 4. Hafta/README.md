# 4. Hafta

# İçindekiler

## HighOrder Functions

## XibFile oluşturma

Öncelikle XibFile oluştururken, File's Owner'a dikkat et. Daha sonra şu şekilde yazılabilir kodları:

```
class XibView: UIView {
    
    @IBOutlet weak var outletButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "XibView") else { return }
        self.backgroundColor = .clear
        self.addSubview(view)
        view.frame = self.bounds
    }
    
     
    @IBAction func changeColor(_ sender: Any) {
        let color: [UIColor] = [.black, .blue, .brown, .cyan, .darkGray, .darkText, .green, .magenta, .orange, .purple, .red, .systemPink]
        let randomColorIndex = arc4random() % 12
        //MARK: view neden değişmiyor arka tarafta anlamadım
        outletButton.backgroundColor = color[Int(randomColorIndex)]
        print(Int(randomColorIndex))
    }
    
}

extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
```

## Notification Center vs Delegate Pattern

Delegate Pattern birebir ilişki olacağı zamanlarda kullanılması gereken bir yapıdır. Büyük projelerde her yerde notification Center kullanmak pek mantıklı bir hareket değildir.

<img width="584" alt="image" src="https://user-images.githubusercontent.com/56068905/203269206-ac91059d-8df4-4d65-bc4c-354b6e7ff876.png">

FirstVC ile yazılan yeri, Notification ile çekeceğim SecondVC'den ve delegate yazan yeri de Delegate Pattern ile yapacağım. Bunları ikinci ekranda notify butonu ile etkinleştireceğim.

### SecondVC

**Delegate**

protocol ile delegate yapısını hazırlıyorum. Ardından butona basıldığında parametre olarak ne vereceğimi belirliyorum.

**Notification**

Key ile post işlemi yapıyorum. object'de ne döndüreceğim belli.

```
import UIKit

protocol textToFirstVCProtocol {
    func didTapped(name: String)
}

class SecondViewController: UIViewController {
    
    var delegate: textToFirstVCProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func notifyAction(_ sender: Any) {
        
        delegate?.didTapped(name: "Omer Delegate")
        
        let text = "Omer Faruk"
        NotificationCenter.default.post(name: NSNotification.Name("buttonPressedNotification"), object: text)
    }
    
}
```
## FirstVC

**delegate**

extension da, delegate edilen şey çağrılıyor. prepare de segue kullanımı var.

**notification**

Observer çağırıyorum ve o observer pattern ile bulmaktadır. Flutter'da ki state management mantığına benzer. 

```
class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var delegateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleButtonPressed), name: NSNotification.Name("buttonPressedNotification"), object: nil)
    }

    @objc func handleButtonPressed(_ notification: Notification) {
        if let text = notification.object as? String {
            label.text = text
        }
    }
    
    
    @IBAction func secondVC(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            guard let vc = segue.destination as? SecondViewController else { return }
            vc.delegate = self
        }
    }
}

extension ViewController: textToFirstVCProtocol {
    func didTapped(name: String) {
        delegateLabel.text = name
    }
}
```

## WebView Kullanımı

Tekrar tekrar ezber kodların üstünde durmaya gerek yok. [Zamanında 100DaysOfSwift de bakmıştım.](https://github.com/ozturkomerfaruk/100DaysOfSwift/blob/master/26.Day/project4/ViewController.swift)

## TabBar Controller

<img width="434" alt="image" src="https://user-images.githubusercontent.com/56068905/203410155-78a982c5-8539-4709-b8e0-ade0bb062699.png">

Bu şekilde bir ekran tasarımı var. Renkli olan kısımlar PageView, onu tabbarda secondPage tarafına bağladım. PageView'dan sonra NavigationController eklemeyi denedim. Bunların sırasının bi önemi yok. 

## Page View

SecondView'e bağlamıştım. Extension ile yazılan yer, sanırsam her proje için yazılabilen ortak bir ifade. Onunda bi espirisi yok. Before - After olayları. Sayfaların çağrımı da identifier üzerinden yapılıyor. Kolaylık olması için sadece arrayden geliyor.

<pre>
class SecondViewController: UIPageViewController {
    
    private lazy var orderedViewController: [UIViewController] = {
        [ self.pageViewController(page: "PageOne"),
          self.pageViewController(page: "PageTwo"),
          self.pageViewController(page: "PageThree") ]
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let vc = orderedViewController.first {
            setViewControllers([vc], direction: .forward, animated: true)
        }
    }
    
    private func pageViewController(page: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(page)ViewController")
    }
}
</pre>

<pre>
extension SecondViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewController.count > previousIndex else {
            return nil
        }
        
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = orderedViewController.firstIndex(of: viewController) else { return nil }
        
        let afterIndex = vcIndex + 1
        
        guard afterIndex != orderedViewController.count else {
            return nil
        }
        
        guard orderedViewController.count > afterIndex else {
            return nil
        }
        
        return orderedViewController[afterIndex]
    }
}

</pre>