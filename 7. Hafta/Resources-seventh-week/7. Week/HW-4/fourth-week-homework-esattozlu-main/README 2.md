
# Fourth-Week-Homework

## BreakingBadApp
--
Breaking Bad App, Breaking Bad karakterlerinin bilgilerini, repliklerini, sezon bölümlerinin bilgilerini ve bölümlerde oynayan karakterleri gösteren, dizinin IMDB sayfasının incelenebildiği bir uygulamadır.
Uygulama, Characters, Episodes, ve IMDB page olmak üzere 3 tab'den ve bu tablere bağlı detay sayfaları ve viewlerinden oluşur.

### 1. Characters Tab
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/204105329-f1e44823-65d3-4725-97aa-c783903dc323.png" alt="drawing" width="275"/></td>  
<td><img src="https://user-images.githubusercontent.com/96587699/204105315-48e02b67-dc21-42ae-a354-ea88dd910d4d.png" alt="drawing" width="275"/></td>  
</td>  
</tr>
</table>
</div>
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/204105319-ad31c97f-d78a-4397-b6d3-e48f27ff33d8.png" alt="drawing" width="275
"/></td>  
<td><img src="https://user-images.githubusercontent.com/96587699/204105323-ff29a532-6d1a-4e02-9b61-0339e489e55a.png" alt="drawing" width="275
"/></td>  
</tr>
</table>
</div>

- Characters Tab'ında Collection View'de tüm oyuncuların resimleri, isimleri, doğum tarihleri ve nickname'leri listelenir.
- Herhangi bir character item'ına tıklanınca character detay sayfası açılır.
- Detay sayfasında karakter ismi, doğum tarihi, nickname'i, mesleği ve görüntülendiği sezon bilgileri bulunur.
- Show quotes butonu ile quotes ekranına geçiş yapılır.
- Quotes ekranında karakterlerin replikleri table view'de listelenir.
- Eğer karakterin repliği yoksa ekrana alert bastırılır.

### 2. Episodes Tab
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/204105324-c844136a-11be-4525-88b5-3968be47c2e5.png" alt="drawing" width="275
"/></td>  
<td><img src="https://user-images.githubusercontent.com/96587699/204105325-6b27e675-f67a-4e79-9b10-2112821b1f67.png" alt="drawing" width="275
"/></td>  
</tr>
</table>
</div>

- Episodes Tab'ında sezonlar ve sezonların altında bölümleri bulunur. Bölümlerin isimleri ve yayın tarihleri yer alır.
- Herhangi bir bölüme tıklanınca bölümdeki karakterler view'i açılır.
- Açılan view'de bölümdeki karakterlerin bilgileri yer alır.
- Sağ üstte bulunan kapat butonu ile view ekrandan kaldırılır.

### 3. IMDB Tab
<div align="center">
<td><img src="https://user-images.githubusercontent.com/96587699/204105327-ac2d6c80-0c15-42f9-9c0a-009d6e499f85.png" alt="drawing" width="275"/></td>  
</div>

- Dizinin IMDB sayfası webview'da gösterilir. Sol üstte sayfa refresh butonu, sağ üstte dizinin IMDB sayfasına geri dönebilmek için homepage butonu bulunur.
