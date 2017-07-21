//
//  ViewController.swift
//  MyRandomColorization
//
//  Created by admin on 2017/7/21.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var audioPlayer :AVAudioPlayer!
    private let gradientLayer = CAGradientLayer.init()
    private var timer :Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool{
        return false
    }

    @IBAction func playMusicDidTouch(_ sender: Any) {
        let bgMusic = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer.init(contentsOf: bgMusic)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let audioError as NSError {
            print(audioError)
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
        }
        
        randomColor()
        
        gradientLayer.frame = view.bounds
        let color1 = UIColor.init(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor.init(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        let color5 = UIColor.init(white: 0.4, alpha: 0.2).cgColor
        
        gradientLayer.colors = [color1,color2,color3,color4,color5]
        gradientLayer.locations = [0.1,0.3,0.5,0.7,0.9]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    @objc func randomColor() {
        self.view.backgroundColor = UIColor.init(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
    }
}

