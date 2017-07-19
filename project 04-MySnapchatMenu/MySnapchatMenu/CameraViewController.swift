//
//  CameraViewController.swift
//  MySnapchatMenu
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    @IBOutlet weak var camera_View: UIView!
    @IBOutlet weak var TempImageView: UIImageView!

    
    let cameraOutput = AVCapturePhotoOutput()
    
    /// 会话对象 （负责输入和输出设置之间的数据传递）
    private lazy var session : AVCaptureSession = AVCaptureSession.init()
    
    /// 输入设备（摄像头）
    private lazy var deviceInput : AVCaptureInput? = {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            let input = try AVCaptureDeviceInput.init(device: device!)
            return input
        } catch  {
            print(error)
            return nil
        }
    }()
    
    /// 输入对象
    private lazy var deviceOutPut : AVCaptureMetadataOutput = AVCaptureMetadataOutput.init()
    
    private lazy var previewLayer : AVCaptureVideoPreviewLayer = {
        let layer = AVCaptureVideoPreviewLayer.init(session: self.session)
        layer.frame = UIScreen.main.bounds
        return layer
    }()
    
    private func startScan(){
        //判断能否将输入添加到会话中
        if !session.canAddInput(deviceInput!) {
            return
        }
        //2.判断能否将输出添加到会话中
        if !session.canAddOutput(deviceOutPut) {
            return
        }
        //3.添加到会话中
        session.addInput(deviceInput!)
        session.addOutput(deviceOutPut)
        //4.设置输出能够解析的数据类型 (一定要在输出对象添加到会话之后才能设置,否则Bug)
        deviceOutPut.metadataObjectTypes = deviceOutPut.availableMetadataObjectTypes  //设置系统所有的数据类型都能解析
        //5.设置输出对象的代理 (只要解析成功就会通知代理)
        deviceOutPut.setMetadataObjectsDelegate(self as! AVCaptureMetadataOutputObjectsDelegate, queue: DispatchQueue.main)
        //添加预览图层到底层
        view.layer.insertSublayer(previewLayer, at: 0)
        //6.告诉session会话,开始扫描
        session.startRunning()
    }

    
    //只要解析到数据,就会调用
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        guard let objc = metadataObjects.last as? AVMetadataMachineReadableCodeObject
            else {
                return
        }
        print(objc.stringValue!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startScan()
    }
}
