//
//  ViewController.swift
//  MyCustomFont
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label_fontShow:UILabel!;
    var button_changeFont:UIButton!
    
    /// 一对“”“ 声明多行字符串
    let message = """
        My 30 Days Swift
        似懂非懂撒发奥大所大所大所大所大所大所大所多撒多
        鞍山市讷讷大奥术师
        阿打算发顺丰
        """
    let fontName = ["Gaspar Regular","MFJinHei_Noncommercial-Regular","MFTongXin_Noncommercial-Regular","MFZhiHei_Noncommercial-Regular"]
    
    var selectFont = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.black
        
        commInit()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    func commInit() {
        subViewAdd()
        subViewLayoutSet()
    }
    
    func subViewAdd() {
        theLabelFontShowAdd()
        theButtonFontChangeAdd()
        
        self.label_fontShow.text = message
        self.label_fontShow.font = UIFont.init(name: fontName[selectFont], size: 20)
    }
    
    func subViewLayoutSet() {
        self.label_fontShow.frame = CGRect.init(x: 0, y: 100, width: self.view.bounds.size.width, height: 250)
        self.button_changeFont.bounds = CGRect.init(x: 0, y: 0, width: 90, height: 90)
        self.button_changeFont.center = CGPoint.init(x: self.view.bounds.size.width/2.0, y: self.view.bounds.size.height-80)
    }
    
    
//MARK:subView
    func theLabelFontShowAdd() {
        self.label_fontShow = UILabel.init()
        self.label_fontShow.textColor = UIColor.white
        self.label_fontShow.textAlignment = NSTextAlignment.center
        self.label_fontShow.numberOfLines = 0
        self.view.addSubview(self.label_fontShow)
    }
    
    func theButtonFontChangeAdd() {
        self.button_changeFont = UIButton.init()
        self.button_changeFont.backgroundColor = UIColor.yellow
        self.button_changeFont.layer.cornerRadius = 45
        self.button_changeFont.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.button_changeFont.setTitle("change fonts", for: UIControlState.normal)
        self.button_changeFont.addTarget(self, action: #selector(changeFontIFButtonDidTouched), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.button_changeFont)
    }

//MARK:InterfaceEvent
    func changeFontIFButtonDidTouched() {
        selectFont += 1
        selectFont = selectFont%4
        self.label_fontShow.font = UIFont.init(name: fontName[selectFont], size: 20)
        print(fontName[selectFont])
    }
}

