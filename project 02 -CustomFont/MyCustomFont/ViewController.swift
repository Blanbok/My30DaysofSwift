//
//  ViewController.swift
//  MyCustomFont
//
//  Created by BlanBok on 2017/7/18.
//  Copyright © 2017年 BlanBok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label_show: UILabel!
    let strData = ["My 30 Days Swift", "户口你们没看过", "过氧化苯", "关于结婚吧", "呵呵，再见🤗 See you next Project",
                   "测试测试测试测试测试测试",
                   "123",
                   "Alex",
                   "@@@@@@"]
    let fontName = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Gaspar Regular"]
    
    var selectFont:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label_show.font = UIFont.init(name: fontName[selectFont], size: 22)
        label_show.text = String(describing: strData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBAction func fontChangeButtonDidTouch(_ sender: Any) {
        selectFont = (selectFont+1)%4
        label_show.font = UIFont.init(name: fontName[selectFont], size: 22)
        print(fontName[selectFont])
    }
    
}

