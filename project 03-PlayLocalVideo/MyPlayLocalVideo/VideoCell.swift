//
//  VideoCell.swift
//  MyPlayLocalVideo
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit

struct video {
    let image : String
    let title : String
    let source : String
}

protocol VideoCellDelegate {
    func playVideoWithUrl(url:String!)
}

class VideoCell: UITableViewCell {

    var videoInfo: video! {
        willSet {

        }
        didSet {
//            self.videoInfo = newValue
            self.videoScreenShot.image = UIImage.init(named: self.videoInfo.image)
            self.videoTitleLabel.text = self.videoInfo.title
            self.videoSourceLabel.text = self.videoInfo.source
            
            self.videoTitleLabel.sizeToFit()
            self.videoSourceLabel.sizeToFit()
        }
    }
    
    var delegate:VideoCellDelegate!
    let videoScreenShot:UIImageView = UIImageView.init()
    let videoTitleLabel:UILabel = UILabel.init()
    let videoSourceLabel:UILabel = UILabel.init()
    let button_playVideo = UIButton.init()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.videoScreenShot.frame.equalTo(self.contentView.bounds) {
            return
        }
        self.videoScreenShot.frame = self.contentView.bounds
        self.videoTitleLabel.center = CGPoint.init(x: self.contentView.bounds.size.width/2.0, y: self.contentView.bounds.size.height-60)

        self.videoSourceLabel.center = CGPoint.init(x: self.contentView.bounds.size.width/2.0, y: self.contentView.bounds.size.height-15)
        
        self.button_playVideo.center = CGPoint.init(x: self.contentView.bounds.size.width/2.0, y: self.contentView.bounds.size.height/2.0)
    }
    
    func commInit() {
        subViewAdd()
//        subViewLayoutSet()
    }
    
    func subViewAdd() {
        theVideoScreenShotAdd()
        theVideoTitleLabelAdd()
        theVideoSourceLabelAdd()
        theButtonPalyVideoAdd()
    }
    
    func subViewLayoutSet() {
        self.videoScreenShot.frame = self.contentView.bounds
        self.videoTitleLabel.center = CGPoint.init(x: self.contentView.bounds.size.width/2.0, y: self.contentView.bounds.size.height-60)
        self.videoSourceLabel.center = CGPoint.init(x: self.contentView.bounds.size.width/2.0, y: self.contentView.bounds.size.height-15)
        self.button_playVideo.center = CGPoint.init(x: self.contentView.bounds.size.width/2.0, y: self.contentView.bounds.size.height/2.0)

    }
    
    //MARK:subViewAdd
    func theVideoScreenShotAdd() {
        self.contentView.addSubview(self.videoScreenShot)
    }
    
    func theVideoTitleLabelAdd() {
        self.videoTitleLabel.textColor = UIColor.white
        self.videoTitleLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(self.videoTitleLabel)
    }
    
    func theVideoSourceLabelAdd() {
        self.videoSourceLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        self.videoSourceLabel.font = UIFont.systemFont(ofSize: 10)
        self.contentView.addSubview(self.videoSourceLabel)
    }
    
    func theButtonPalyVideoAdd() {
        self.button_playVideo.setBackgroundImage(UIImage.init(named: "playBtn"), for: UIControlState.normal)
        self.button_playVideo.addTarget(self, action: #selector(playVideoIFButtonTouched), for: UIControlEvents.touchUpInside)
        self.button_playVideo .sizeToFit()
        self.contentView.addSubview(self.button_playVideo)
    }
    //MARK:interfaceEvent
    @objc func playVideoIFButtonTouched() {
        self.delegate?.playVideoWithUrl(url: self.videoInfo.source)
    }
}
