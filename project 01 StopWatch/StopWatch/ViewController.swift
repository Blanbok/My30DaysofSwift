//
//  ViewController.swift
//  StopWatch
//
//  Created by admin on 2017/7/18.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// 屏幕宽度
    let SCREEN_width = UIScreen.main.bounds.width
    ///屏幕高度
    let SCREEN_height = UIScreen.main.bounds.height
    
    
    
///创建可选类型的变量，并设置隐式解包的特性
/*
     可选类型的可以为nil，所以可以在
             可选类型：‘值可能不存在的情况下，你可以使用可选类型。 一个可选类型代表两种可能性：要么它有值(你可以通过解包来访问该值), 或者没有值。’
 */
    
    /// 开始按钮
    var button_play:UIButton!

    /// 暂停按钮
    var button_pasue:UIButton!
    
    /// 重置按钮
    var button_reset:UIButton!
    
    /// 定时器控制的文本标签
    var label_time:UILabel!
    
    /// 定时器对象
    var timer = Timer.init()
    
    /// 标识量
    var Counter = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        commInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func commInit() {
        subViewAdd()
        subViewlayoutSet()
        
    }
    
    func subViewAdd() {
        theButtonPlayAdd()
        theButtonPasueAdd()
        theLabelTimeAdd()
        theButtonResetAdd()
    }
    
    func subViewlayoutSet(){
        
        self.label_time.frame = CGRect.init(x: 0, y: 0, width: SCREEN_width, height: 200)
        self.button_reset.frame = CGRect.init(x: SCREEN_width - 100, y: 40, width: 70, height: 30)
        self.button_play.frame = CGRect.init(x: 0, y: self.label_time.frame.maxY, width: SCREEN_width/2.0, height: SCREEN_height-200)
        self.button_pasue.frame = CGRect.init(x: SCREEN_width/2.0, y: self.label_time.frame.maxY, width: SCREEN_width/2.0, height: SCREEN_height-200)

    }
    
    //MARK:subViewAdd 添加子视图
    
    func theButtonPlayAdd()  {
        self.button_play    = UIButton.init(type: UIButtonType.custom)
        self.button_play.backgroundColor = UIColor.blue
        self.button_play.setImage(UIImage.init(named: "play"), for: UIControlState.normal)
        self.view.addSubview(self.button_play)
        
        self.button_play.addTarget(self, action: #selector(playButtonDidTouch(sender:)), for: .touchUpInside)
    }
    
    func theButtonPasueAdd() {
        self.button_pasue   = UIButton.init(type: UIButtonType.custom)
        self.button_pasue.setImage(UIImage.init(named: "pause"), for: UIControlState.normal)
        self.button_pasue.backgroundColor = UIColor.green
        self.button_pasue.isEnabled = false
        self.view.addSubview(self.button_pasue)
        
        self.button_pasue.addTarget(self, action:#selector(pasueButtonDidTouch(sender:)), for: .touchUpInside)
    }
    
    func theButtonResetAdd() {
        self.button_reset   = UIButton.init(type: UIButtonType.custom)
        self.button_reset.setTitle("reset", for: UIControlState.normal)
        self.button_reset.setTitleColor(UIColor.blue, for: UIControlState.normal)
        self.view.addSubview(self.button_reset)
        
        self.button_reset.addTarget(self, action: #selector(resetButtonDidTouch(sender:)), for: UIControlEvents.touchUpInside)
    }
    
    func theLabelTimeAdd() {
        self.label_time     = UILabel.init()
        self.label_time.text = String.init(format: "%.1f", Counter)
        self.label_time.textAlignment = NSTextAlignment.center
        self.label_time.font = UIFont.systemFont(ofSize: 71)
        self.label_time.backgroundColor = UIColor.black
        self.label_time.textColor = UIColor.white
        self.view.addSubview(self.label_time)
    }
    
    //MARK:InterfaceEvent
    
    /// 启动
    ///
    /// - Parameter sender: 启动按钮
    @objc func playButtonDidTouch(sender:UIButton) {
        sender.isEnabled = false
        self.button_pasue.isEnabled = true
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timerUpdata), userInfo: nil, repeats: true)
        
    }
    
    
    /// 暂停
    ///
    /// - Parameter sender: 暂停按钮
    @objc func pasueButtonDidTouch(sender: UIButton) {
        sender.isEnabled = false
        self.button_play.isEnabled = true
        
        self.timer.invalidate()
    }
    
    
    /// 复位
    ///
    /// - Parameter sender: 复位按钮
    @objc func resetButtonDidTouch(sender:Any) {
        self.button_pasue.isEnabled = false
        self.button_play.isEnabled = true
        Counter = 0
        self.label_time.text = String.init(format: "%.1f", Counter)
    }
    
    
    /// 定时器刷新
    @objc func timerUpdata() {
        Counter += 0.1
        self.label_time.text = String.init(format: "%.1f", Counter)
    }
}

