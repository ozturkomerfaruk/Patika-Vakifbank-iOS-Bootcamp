# 2. Hafta

Class, reference type olarak geçer. Yani aynı sınıftan türeyen iki obje eşitlendiğinde, 2 objenin de değeri birebir aynı olur.

Enum ve Struct ise value types olarak geçer. Yani iki obje burada eşitlense bile, bunlar farklı yerlerde tutulur. Yani sadece kopyalar ama veriler Stack de tutulmaya devam edilir.

Struct yapısında fonksiyonda değişebilirlik eklemek için mutating eklenir.

```
struct Resolution {
    var width = 0
    var heigth = 0
    mutating func lowResolution() {
        self.width = 320
        self.heigth = 240
        print("\(self.width) & \(self.heigth) -> lowResolution mutated")
    }
}
```

