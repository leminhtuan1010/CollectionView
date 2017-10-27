//
//  ViewController.swift
//  CollectionView
//
//  Created by Minh Tuan on 10/27/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var a: Bool = false
    var data = ["anh1.png","anh2.png","anh3.png","anh4.pg","anh5.png","anh6.png","anh7.png","anh8.png","anh9.png","anh10.png","anh1.png","anh2.png","anh3.png","anh4.pg","anh5.png","anh6.png","anh7.png","anh8.png","anh9.png","anh10.png","anh1.png","anh2.png","anh3.png","anh4.pg","anh5.png","anh6.png","anh7.png","anh8.png","anh9.png","anh10.png","anh3.png","anh4.pg","anh1.png","anh2.png","anh3.png","anh4.pg","anh5.png","anh6.png","anh7.png","anh8.png","anh9.png","anh10.png","anh1.png","anh2.png","anh3.png","anh4.pg","anh5.png","anh6.png","anh7.png","anh8.png","anh9.png","anh10.png","anh1.png","anh2.png","anh3.png","anh4.pg","anh5.png","anh6.png","anh7.png","anh8.png","anh9.png","anh10.png","anh3.png","anh4.pg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        itemChange()
    }
    func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.isPagingEnabled = true
        collectionView.register(UINib.init(nibName: "CollectionView", bundle: nil), forCellWithReuseIdentifier: "CollectionView")
        if let flowLayOut = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayOut.itemSize = CGSize(width: view.bounds.size.width / 3 - 2, height: view.bounds.size.height
                / 6)
            flowLayOut.minimumInteritemSpacing = 2
            flowLayOut.minimumLineSpacing = 2
            
            
            // thuộc tính scrollDirection đã lưu sẵn trạng thái của thuộc tính(giống như dạng true false)
            if flowLayOut.scrollDirection == .vertical {
                flowLayOut.scrollDirection = .horizontal
            }
            else {
                flowLayOut.scrollDirection = .vertical
            }
            
            
            // Sử dụng cách truền thống 
            //            if a == true{
            //                flowLayOut.scrollDirection = .horizontal
            //            }else if a == false{
            //                flowLayOut.scrollDirection = .vertical
            //            }
        }
    }
    func itemChange(){
        let item = UIBarButtonItem(image: #imageLiteral(resourceName: "if_Refresh_105225"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(change))
        navigationItem.rightBarButtonItem = item
    }
    @objc func change(){
        
        if a == true{
            a = false
        }else if a == false {
            a = true
        }
        setUpCollectionView()
        
        print(a)
    }
    
    
}
extension ViewController:UICollectionViewDelegate{
    
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionView", for: indexPath) as? CollectionView else {return UICollectionViewCell()}
        Cell.configureCell(data[indexPath.item])
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewCollection = ViewImageViewConroller(nibName: "ViewImageViewConroller", bundle: nil)
        viewCollection.imageView = data[indexPath.row]
        navigationController?.pushViewController(viewCollection, animated: true)
        print(indexPath.row)
    }
}
extension ViewController:UICollectionViewDelegateFlowLayout{
    
}
