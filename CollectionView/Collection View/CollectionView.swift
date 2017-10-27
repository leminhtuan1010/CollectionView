//
//  CollectionView.swift
//  CollectionView
//
//  Created by Minh Tuan on 10/27/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class CollectionView: UICollectionViewCell {

    @IBOutlet weak var photoFruit: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    func configureCell(_ name: String){
   photoFruit.image = UIImage(named: name)
    }
}
