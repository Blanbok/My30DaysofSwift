//
//  CameraViewController.swift
//  MySnapchatMenu
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit
import AVFoundation

//创建一个实时的视频摄像
class CameraViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    /// 会话对象 （负责输入和输出设置之间的数据传递即捕获视频音频数据） 可以设置捕获数据的bitrate
    private lazy var session : AVCaptureSession = {
        let asession = AVCaptureSession.init()
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone{
            asession.sessionPreset = AVCaptureSession.Preset.hd1280x720
        }else{
            asession.sessionPreset = AVCaptureSession.Preset.photo
        }
        return asession
    }()
    
    /// 输入设备（摄像头）
    private lazy var deviceInput : AVCaptureInput! = {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            let input = try AVCaptureDeviceInput.init(device: device!)
            return input
        } catch  {
            print(error)
            return nil
        }
    }()
    
    /// 输出对象
    private lazy var deviceOutPut = AVCaptureVideoDataOutput.init()
    
    /// 展示图层
    private lazy var previewLayer : AVCaptureVideoPreviewLayer = {
        let layer = AVCaptureVideoPreviewLayer.init(session: self.session)
        layer.frame = UIScreen.main.bounds
        self.view.layer.addSublayer(layer)
        return layer
    }()
    
    private func startScan(){
        //guard 语句 语意和if相反 判断不执行
        
        //判断能否将输入添加到会话中
        //2.判断能否将输出添加到会话中
        guard session.canAddInput(deviceInput)&&session.canAddOutput(deviceOutPut) else {
            return
        }
        //3.添加到会话中
        session.addInput(deviceInput!)
        session.addOutput(deviceOutPut)
        //添加预览图层到底层
        view.layer.insertSublayer(previewLayer, at: 0)
        //6.告诉session会话,开始扫描
        session.startRunning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startScan()
    }
    
}
