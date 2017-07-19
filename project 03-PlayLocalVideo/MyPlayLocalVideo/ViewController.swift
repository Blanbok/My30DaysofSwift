//
//  ViewController.swift
//  MyPlayLocalVideo
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,VideoCellDelegate {
    static let ReuseIdentifier = "reuseVideoCell"
    
    let videoTableView:UITableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
    let playViewController = AVPlayerViewController.init()
    
    let dataSource:Array<video> = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        subViewAdd()
        
        
        if #available(iOS 11.0, *) {
            self.videoTableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
        };
        

        
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func subViewAdd() {
        theTableViewAdd()
    }
    
    //MARK:subView
    func theTableViewAdd() {

        self.videoTableView.frame = self.view.bounds
        self.videoTableView.backgroundColor = UIColor.red
        self.videoTableView.showsVerticalScrollIndicator = false
        self.videoTableView.delegate = self
        self.videoTableView.dataSource = self
        self.videoTableView.bounces = false
        self.videoTableView.register(object_getClass(VideoCell()), forCellReuseIdentifier: ViewController.ReuseIdentifier)
        
        self.view.addSubview(self.videoTableView)
    }
    
    //MARK:tableViewDele
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.ReuseIdentifier, for: indexPath) as! VideoCell
        let VideoModel:video = dataSource[indexPath.row]
        cell.videoInfo = VideoModel
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }


    
    func playVideoWithUrl(url: String!) {
        
        let path:String! = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        let playerView:AVPlayer = AVPlayer.init(url: NSURL.fileURL(withPath: path))
        
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
}

