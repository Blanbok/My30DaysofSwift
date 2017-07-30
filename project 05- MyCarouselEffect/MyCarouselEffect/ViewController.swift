//
//  ViewController.swift
//  MyCarouselEffect
//
//  Created by admin on 2017/7/20.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    private static let ReuseIdentifier:String = "reuseCell"
    
    private lazy var collectionView:UICollectionView = {
        let flow = UICollectionViewFlowLayout.init()
        flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        flow.itemSize = CGSize.init(width: 375, height: 667)
        
        let  collectionView = UICollectionView.init(frame: UIScreen.main.bounds, collectionViewLayout: flow)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = false
        collectionView.register(UINib.init(nibName: "InsertCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ViewController.ReuseIdentifier)
        collectionView.layer.contents = UIImage.init(named: "blue")?.cgImage
        self.view.addSubview(collectionView)
        return collectionView
    }()
    
    let feedEntity = [InsertModel(title:"Hello there, i miss u.",imageName:"hello"),
                      InsertModel(title:"🐳🐳🐳🐳🐳",imageName:"dudu"),
                      InsertModel(title:"Training like this, #bodyline",imageName:"bodyline"),
                      InsertModel(title:"I'm hungry, indeed.",imageName:"wave"),
                      InsertModel(title:"Dark Varder, #emoji",imageName:"darkvarder"),
                      InsertModel(title:"I have no idea, bitch",imageName:"hhhhh"),
                      ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.feedEntity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.ReuseIdentifier, for: indexPath) as! InsertCollectionViewCell
        cell.imageView_head.image = UIImage.init(named: self.feedEntity[indexPath.item].imageName)
        cell.label_title.text = self.feedEntity[indexPath.item].title
        return cell
    }

}

