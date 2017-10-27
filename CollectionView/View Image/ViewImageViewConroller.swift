//
//  ViewImageViewConroller.swift
//  CollectionView
//
//  Created by Minh Tuan on 10/27/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class ViewImageViewConroller: UIViewController {

    @IBOutlet weak var viewImg: UIImageView!
    var imageView = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewImg.layer.cornerRadius = viewImg.frame.size.width / 2
        viewImg.clipsToBounds = true
       viewImg.image = UIImage(named: imageView)
    }
}
