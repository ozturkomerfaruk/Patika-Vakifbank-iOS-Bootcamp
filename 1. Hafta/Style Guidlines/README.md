# Swift Design Guidelines

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



