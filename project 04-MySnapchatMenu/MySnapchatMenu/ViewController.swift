//
//  ViewController.swift
//  MySnapchatMenu
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentInsetAdjustmentBehavior = .never
        
        let leftView:LeftViewController = LeftViewController.init(nibName: "LeftViewController", bundle: nil)
        let rightView:RightViewController = RightViewController.init(nibName: "RightViewController", bundle: nil)
        let centerView:CameraViewController = CameraViewController.init(nibName: "CameraViewController", bundle: nil)


        self.addChildViewController(leftView)
        scrollView.addSubview(leftView.view)
        leftView.didMove(toParentViewController: self)

        self.addChildViewController(centerView)
        scrollView.addSubview(centerView.view)
        centerView.didMove(toParentViewController: self)

        self.addChildViewController(rightView)
        scrollView.addSubview(rightView.view)
        rightView.didMove(toParentViewController: self)

        var centerFrame = centerView.view.frame
        centerFrame.origin.x = self.view.frame.width
        centerView.view.frame = centerFrame

        var rightFrame = rightView.view.frame
        rightFrame.origin.x = self.view.frame.width*2
        rightView.view.frame = rightFrame

        self.scrollView.contentSize = CGSize.init(width: self.view.bounds.size.width*3, height: self.view.bounds.size.height)

    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

