//
//  ViewController.swift
//  HW10
//
//  Created by Admin on 06.05.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.priceLabel.text = "139$"
        cell.priceLabel.textColor = UIColor.red
        cell.imageCell.image = #imageLiteral(resourceName: "11")
        return cell
    }
    
    //Method can not be add by auto-complete or auto-addition
    //Method can be useful for change cell size
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath IndexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: 200, height: 100)
//        return size
//    }
}

