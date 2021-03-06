# **Collection View**

## Ứng dụng áp dụng Collection view

## Giới thiệu:

* [ ] Ứng dụng được hiển thị trên màn hình với 1 list hình ảnh 
* [ ] Khi click vào từng ảnh thì sẽ chuyển sang một màn hình khác hiển thị toàn bộ hình ảnh với kích thước lớn hơn
* [ ] Nút refresh có tác dụng đổi trạng thái của danh sách hình ảnh từ horizontal thành verticalvertical
* [ ] Trong bài viết dưới đây sẽ từng bước nói bài toán này

### Bước 1:

* Khởi tạo Collection view 
* Khởi tạo navigation

![](.../Screen Shot 2017-10-27 at 11.51.54 PM.png)

### Bước 2:

* Custom cell của collection view :

Tạo một func condigure có tác dụng hứng các chuỗi ảnh để hiển thị lên các Cell

```

func configureCell(_ name: String){

photoFruit.image = UIImage(named: name)

 }

```

* Gọi cell vừa costom lên trên CollectionView vừa được khởi tạo.

```
collectionView.register(UINib.init(nibName: "CollectionView", bundle: nil), forCellWithReuseIdentifier: "CollectionView")

```

* Truyền dữ liệu lên trên Cell và hiển thị số Cell trên Collection

```

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {

returndata.count

 }

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

guardlet Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionView", for: indexPath) as? CollectionViewelse {returnUICollectionViewCell()}

 Cell.configureCell(data[indexPath.item])

return Cell

 }

```

### Bước 3:

* Tạo một hàm để hứng dữ liệu khi click vào các Cell :

khởi tạo một biến ImageView có kiểu String để hứng dữ liệu từ Cell về .Sau khi khởi tạo thì chúng ta hiển thị dữ liệu lên trên màn hình dứoi đúng dạng hình ảnh với các tham số đã được nhận tư Cell.  
```

var imageView = String()

overridefunc viewDidLoad() {

super.viewDidLoad()

viewImg.layer.cornerRadius =viewImg.frame.size.width /2

viewImg.clipsToBounds =true

viewImg.image = UIImage(named: imageView)

```

* Truyền dữ liệu từ Collection View sang View ảnh bằng cách sử dụng hàm didSelectItemAt indexPath

```
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

let viewCollection = ViewImageViewConroller(nibName: "ViewImageViewConroller", bundle: nil)

 viewCollection.imageView = data[indexPath.row]

 navigationController?.pushViewController(viewCollection, animated:true)

 }

```

### Bước 4:

* Thuộc tính của scrollDirection trong collectionView nó đã tự lưu trạng thái của chính nó giống như giá trị true và false chính vì thế chúng ta chỉ cần if else để chuyển đổi trạng thái cho chúng.  
```

  if flowLayOut.scrollDirection == .vertical {

   flowLayOut.scrollDirection = .horizontal

   }

  else {

   flowLayOut.scrollDirection = .vertical

   }

```

* Lưu ý khi chúng ta làm như vậy thì nhớ phải xét lại giá trị của hàm khi ấn nút.



