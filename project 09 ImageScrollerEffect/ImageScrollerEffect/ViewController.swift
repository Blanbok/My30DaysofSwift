//
//  ViewController.swift
//  ImageScrollerEffect
//
//  Created by admin on 2017/7/21.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView_head: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView_head
    }

    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

