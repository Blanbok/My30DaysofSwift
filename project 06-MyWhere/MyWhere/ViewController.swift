//
//  ViewController.swift
//  MyWhere
//
//  Created by admin on 2017/7/20.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var label_location: UILabel!
    
    /// 位置管理器
    private lazy var locationManager:CLLocationManager = {
        let locationManager = CLLocationManager.init()
        locationManager.delegate = self
        
        //设置所需精度为最好的精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //设置一直在请求授权
        locationManager.requestAlwaysAuthorization()
        return locationManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //开始更新位置（获取位置信息
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBAction func findLocationWhenTouch(_ sender: Any) {
        
        locationManager.startUpdatingLocation()
    }
    
    
    /// 获取位置信息失败
    ///
    /// - Parameters:
    ///   - manager: 位置管理器
    ///   - error: 错误信息
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.label_location.text = "Error while updating location" + error.localizedDescription
    }
    
    
    /// 位置信息更新
    ///
    /// - Parameters:
    ///   - manager: 位置管理器
    ///   - locations: 位置信息
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //地址解析工具进行地址解析
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                self.label_location.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
            } else {
                self.label_location.text = "Problem with the data received from geocoder"
            }
        })
    }
    
    
    /// 位置信息处理
    ///
    /// - Parameter placemark: 地标
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.label_location.text = postalCode! + " " + locality!
            
            self.label_location.text?.append("\n" + administrativeArea! + ", " + country!)
        }
        
    }
    
}

