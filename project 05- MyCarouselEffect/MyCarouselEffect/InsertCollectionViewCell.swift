//
//  InsertCollectionViewCell.swift
//  MyCarouselEffect
//
//  Created by admin on 2017/7/20.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit

struct InsertModel {
    var  title:String!
    var imageName:String!
}

class InsertCollectionViewCell: UICollectionViewCell {
    /// 背景图
    @IBOutlet weak var imageView_head: UIImageView!
    /// 标题
    @IBOutlet weak var label_title: UILabel!

}
