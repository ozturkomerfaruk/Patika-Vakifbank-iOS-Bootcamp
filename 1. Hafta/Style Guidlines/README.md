Burada Swift API Design Guidelines açıklamaya çalıştım. Ancak bunun gibi çok büyük şirketlerin kendi rehberleri bulunmaktadır. Burada yazılanlara tamamen ek olarak çıkarılan, yani buradaki ususlara ek olarak yazılan rehberler düşünün ve bunları yapanlar Google, LinkedIn ve Airbnb gibi şirketler. Bunları ayrıca incelemenizi isterim. Kendi yazım stilinizi oluşturmak çok önemli bir husustur.

* Linkedin için [tıklayınız.](https://github.com/linkedin/swift-style-guide)
* Airbnb için [tıklayınız.](https://github.com/airbnb/swift)
* Google için [tıklayınız.](https://google.github.io/swift/)

# Swift API Design Guidelines

Referans linki için [tıklayabilirsiniz.](https://www.swift.org/documentation/api-design-guidelines/#parameter-names)

## Fundamentals

* Clarity yani netlik en önemli konudur. Entities bir kez tanımlanır ama birçok yerde kullanılır. Temiz ve net olmalıdır. 

* Clarity yani netlik, brevity 'den yani, kısalıktan çok daha önemlidir. Swift bazen karmaşık olsa da eğer netse, esas olan budur.

* Her declaration'da yani bir değişken tanımlama da documentation comment yazın. Yani yorum yazın.

### Yorumlar Hakkında

Bir fonskiyon tanımlaması söz konusu ise üstünde açıklamasını yazmanız gerekmektedir.

```
/// Returns a "view" of `self` containing the same elements in
/// reverse order.
func reversed() -> ReverseCollection
```

Bu yorum satırlarının bazı hedef noktaları olmak zorundadır.

1. Özete odaklanmalı. Yorum satırları uzun uzadıya yazılmamalı.
2. Mümkünse nokta ile biten tek bir cümle olsun.
3. Ne dönüyorsa belli edin. Mesela void ya da null dönebileceğini belirtin. Örneğin;

```
/// Inserts `newHead` at the beginning of `self`.
mutating func prepend(_ newHead: Int)

/// Returns a `List` containing `head` followed by the elements
/// of `self`.
func prepending(_ head: Element) -> List

/// Removes and returns the first element of `self` if non-empty;
/// returns `nil` otherwise.
mutating func popFirst() -> Element?
```
4. subscript'in neye erişim yaptığını açıklayın.
```
/// Accesses the `index`th element.
subscript(index: Int) -> Element { get set }
```
5. init oluşturduğunuz zaman neyi oluşturduğunu açıklayın.
6. Tüm diğer declarate ettiklerimizi neye ettiğimizi açıklamamız gerekmektedir.

### Önemli olan bazı hususlar
|!|!|!|!|
|---|---|---|---|
|Attention|Author|Authors|Bug|
|Complexity|Copyright|Date|Experiment|
|Important|Invariant|Note|Parameter|
|Parameters|Postcondition|Precondition|Remark|
|Requires|Returns|SeeAlso|Since|
|Throws|ToDo|Version|Warning|

Bu bilgileri nasıl yorum satırına geçireceğinizin bilgileri için [tıklayınız.](https://www.swift.org/documentation/api-design-guidelines/#parameter-names)


## Naming

1. İsimlendirmelerin tamamınd belirsizliklerden kaçınmanız gerekmektedir.
2. İsimlendirme yaparken belirgin ifadeyi belirtin. Her kelimeyi isimlendirmek zorunda değilsiniz. Mesela fonksiyonun ismi removeElement olmak zorunda değil. sadece remove yeterli.
3. İsimlendirme yaparken değişkenin türünü tekrar yazmana gerek yok. Onun yerine ne olduğunu belirt yeter. Ancak protocol tanımlarken sonuna protocol yazmalısın. bu neye karşı protocol yaptığını belirtirken, çakışmasını önler. Ancak amaç tamamen netliktir. Yani clarity!. Eğer remove derken mesela neyi remove edeceği belli değil ise devamını da yazmak gerekir.

## Strive for Fluent Usage

1. İsimlendirme yapılırken İngilizce formları esas alın. Mesela
```
x.insert(y, at: z)

x.insert(y, position: z)
```
Mesela burada ki ikinci ifade yanlıştır. En çok kullanılan kısım at preposition'ıdır. Position ile kullanmak kafa karışıklığına sebebiyet verir. Burada en önemli husus: İnsanların en çok kullandığı yazılım stlini kullanmaktadır. Bireyselcilikten uzak kalmaktır.


2. Fonksiyonları ve Metotları yan etkilerine göre adlandırın

Yan etkisi olmayanlar isim tamlamaları şekilde okunmalıdır.

```x.distance(to: y), i.successor().```

3. Mutating ve Nonmutating Farkı

|Mutating|Nonmutating|
|---|---|
|x.sort()|z = x.sorted()|
|x.append(y)| z = x.appending(y)|


**Mutating** Genellikle örneği güncellemek yerine yeni bir tür belirtir.

**Nonmutating** değişmeyen karşılığını anlamlandırmak için -ed ve -ing kullanılır.

* Fiilin geçmiş ortaçını kullanarak (genellikle “ed” ekini ekleyerek) değişmeyen varyantı adlandırmayı tercih edin:
```
/// Reverses `self` in-place.
mutating func reverse()

/// Returns a reversed copy of `self`.
func reversed() -> Self
...
x.reverse()
let y = x.reversed()
```
Fiilin doğrudan bir nesnesi olduğu için “ed” eklenmesi dilbilgisel olmadığında, fiilin şimdiki ortaçını kullanarak değişmeyen varyantı “ing” ekleyerek adlandırın.

```
/// Strips all the newlines from `self`
mutating func stripNewlines()

/// Returns a copy of `self` with all the newlines stripped.
func strippingNewlines() -> String
...
s.stripNewlines()
let oneLine = t.strippingNewlines()
```

|Mutating|Nonmutating|
|---|---|
|y.formUnion(z)|x = y.union(z)|
|c.formSuccessor(&i)|j = c.successor(i)|

4. Boolean yöntemleri ve özellikleri, kullanım değişmediğinde alıcı hakkında iddialar olarak okunmalıdır.
5. Bir şeyin ne olduğunu tanımlayan protokoller isim olarak okunmalıdır.
6. Bir yeteneği tanımlayan protokoller, mümkün, ible veya ing sonekleri kullanılarak adlandırılmalıdır.
7. Diğer types, properties, variables ve constants isim olarak okunmalıdır.

## Use Terminology Well

1. Belirsiz terimlerden kaçın.
2. Eğer bir terim kullanılacaksa herkesin anlayabileceği bir terim kullanın. Halk arasında kullanılan bir tabir bile olabilir.
3. Kısaltmalardan sakının.
4. Geçmiş örnekler varsa onlara sıkıca bağlanın. Eğer bir projeye dahil olduysanız onların kullanmış olduğu isimlendirmelerde ne kullanılıyorsa genel olarak sizde onu kullanın farklı bir şeyler türeterek insanların aklını karıştırmayın :)

## Conventions

## General Conventions

1. O(1) olmayan herhangi bir hesaplanmış özelliğin karmaşıklığını belgeleyin. Eğer bir projede çok büyük complexityler çıkıyorsa bunu söylemekten çekinmeyin.
2. min, sin gibi metotların kullanılması gerektiğinde kullanmaktan çekinmeyin. Çok daha performanslıdır.
3. Types ve Protocols adlandırmaları -> UpperCamelCase şeklindeyken geri kalan her şey lowerCamelCase şeklindedir. Bu kural yazılım da yazılı olmayan en önemli kurallardan biridir. Lütfen uyalım. :)


## Parameters
1. Doğru bir şekilde yorum satırları bu şekilde olmalıdır ve parametre bu şekilde ifade edilmeli. Kısa ve öz olmalı.

```
/// Return an `Array` containing the elements of `self`
/// that satisfy `predicate`.
func filter(_ predicate: (Element) -> Bool) -> [Generator.Element]

/// Replace the given `subRange` of elements with `newElements`.
mutating func replaceRange(_ subRange: Range, with newElements: [E])
```
2. Mesela bir fonksiyon içerisinde boş array yazmaya gerek yok yada optional olabilir bir şekilde nil yazmaya gerek yok zaten default da öyleler.

Olmaması gereken:

```
let order = lastName.compare(
  royalFamilyName, options: [], range: nil, locale: nil)
```

Olması gereken:
```
let order = lastName.compare(royalFamilyName)
```

3. Not türünde: Varsayılan argümanlar genellikle yöntem ailelerinin kullanımına tercih edilir, çünkü API'yi anlamaya çalışan herkese daha az bilişsel yük getirirler.

```
extension String {
  /// ...description...
  public func compare(
     _ other: String, options: CompareOptions = [],
     range: Range? = nil, locale: Locale? = nil
  ) -> Ordering
}
```

Bir method ailesinin her bir üyesinin ayrı ayrı belgelenmesi ve kullanıcılar tarafından anlaşılması gerekir. Aralarında karar vermek için kullanıcının hepsini ve zaman zaman şaşırtıcı ilişkileri anlaması gerekir.

## Argument Labels

1. Argümanlar kullanışlı bir şekilde ayırt edilemediğinde tüm etiketleri atlayın
2. Değer koruma türü dönüştürmeleri gerçekleştiren başlatıcılarda, ilk bağımsız değişken etiketini atlayın

* İlk argüman her zaman source of the conversion olmalıdır.
```
extension String {
  // Convert `x` into its textual representation in the given radix
  init(_ x: BigInt, radix: Int = 10)   ← Note the initial underscore
}

text = "The value is: "
text += String(veryLargeNumber)
text += " and in hexadecimal, it's"
text += String(veryLargeNumber, radix: 16)
```

```
extension UInt32 {
  /// Creates an instance having the specified `value`.
  init(_ value: Int16)            ← Widening, so no label
  /// Creates an instance having the lowest 32 bits of `source`.
  init(truncating source: UInt64)
  /// Creates an instance having the nearest representable
  /// approximation of `valueToApproximate`.
  init(saturating valueToApproximate: UInt64)
}
```
Bu gibi durumlarda, soyutlamayı açık tutmak için argüman etiketine preposition'dan sonra başlayın.
```
a.moveTo(x: b, y: c)
a.fadeFrom(red: b, green: c, blue: d)
```

## Special Instructions

Closure parametreleri için kullanılan adlar, üst düzey işlevler için parametre adları gibi seçilmelidir. Çağrı sitesinde görünen closure argümanları için etiketler desteklenmez.

Bu isimlerin açıklama gücü vardır, dokümantasyon yorumlarından referans alınabilir ve grup üyelerine anlamlı erişim sağlar.

```
/// Ensure that we hold uniquely-referenced storage for at least
/// `requestedCapacity` elements.
///
/// If more storage is needed, `allocate` is called with
/// `byteCount` equal to the number of maximally-aligned
/// bytes to allocate.
///
/// - Returns:
///   - reallocated: `true` if a new block of memory
///     was allocated; otherwise, `false`.
///   - capacityChanged: `true` if `capacity` was updated;
///     otherwise, `false`.
mutating func ensureUniqueStorage(
  minimumCapacity requestedCapacity: Int, 
  allocate: (_ byteCount: Int) -> UnsafePointer<Void>
) -> (reallocated: Bool, capacityChanged: Bool)
```

Aşırı yükleme kümelerinde belirsizlikleri önlemek için sınırlandırılmamış polimorfizm (örneğin Any, AnyObject ve sınırlandırılmamış genel parametreler) konusunda ekstra özen gösterin.

```
struct Array {
  /// Inserts `newElement` at `self.endIndex`.
  public mutating func append(_ newElement: Element)

  /// Inserts the contents of `newElements`, in order, at
  /// `self.endIndex`.
  public mutating func append(_ newElements: S)
    where S.Generator.Element == Element
}
```

Bu yöntemler semantik bir aile oluşturur ve argüman türleri ilk başta keskin bir şekilde farklı görünür. Ancak, Öğe herhangi biri olduğunda, tek bir öğe, bir öğe dizisiyle aynı türe sahip olabilir.

```
var values: [Any] = [1, "a"]
values.append([2, 3, 4]) // [1, "a", [2, 3, 4]] or [1, "a", 2, 3, 4]?
```
Belirsizliği ortadan kaldırmak için ikinci aşırı yüklemeyi daha açık bir şekilde adlandırın.
```
struct Array {
  /// Inserts `newElement` at `self.endIndex`.
  public mutating func append(_ newElement: Element)

  /// Inserts the contents of `newElements`, in order, at
  /// `self.endIndex`.
  public mutating func append(contentsOf newElements: S)
    where S.Generator.Element == Element
}
```

Yeni adın belge yorumuyla nasıl daha iyi eşleştiğine dikkat edin. Bu durumda, belge yorumu yazma eylemi aslında sorunu API yazarının dikkatine getirdi.
