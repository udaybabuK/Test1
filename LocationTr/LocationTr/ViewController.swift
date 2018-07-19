//
//  ViewController.swift
//  LocationTr
//
//  Created by Orient Technologies Mac on 6/19/18.
//  Copyright © 2018 Orient. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var lblText: UILabel!
   var locationManager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
      // self.determineMyCurrentLocation()
        locationManager = self.determineMyCurrentLocation()
        lblText.text = "Hi udai i am you'r friend please say somthing to do"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sharedLocationManager() -> CLLocationManager {
        let mylocationManager:CLLocationManager = CLLocationManager()
            mylocationManager.delegate = self
            mylocationManager.desiredAccuracy = kCLLocationAccuracyBest
            mylocationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
         return mylocationManager
    }
    
    func determineMyCurrentLocation() -> CLLocationManager{
        if locationManager == nil {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        }
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
        return locationManager
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        print("user speed = \(userLocation.speed)")
        print("user altitude = \(userLocation.altitude)")
        print("user horizontalAccuracy = \(userLocation.horizontalAccuracy)")
        
        if ((LocationShareModel.sharedInstance.timer) != nil) {
            return;
        }
        
        LocationShareModel.sharedInstance.timer = Timer.scheduledTimer(timeInterval: 120, target: self, selector: #selector(restartLocationUpdates), userInfo: nil, repeats: false)
      let Ktimer: Timer!
       Ktimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stopLocationDelayBySeconds), userInfo: nil, repeats: false)

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    func restartLocationUpdates() -> Void {
        print("restartLocationUpdates")
        if (LocationShareModel.sharedInstance.timer != nil) {
            LocationShareModel.sharedInstance.timer.invalidate()
            LocationShareModel.sharedInstance.timer = nil
        }
        locationManager.startUpdatingLocation()
    }
    func stopLocationTracking() -> Void {
        if (LocationShareModel.sharedInstance.timer != nil) {
            LocationShareModel.sharedInstance.timer.invalidate()
            LocationShareModel.sharedInstance.timer = nil
        }
        locationManager.stopUpdatingLocation()
    }
    func stopLocationDelayBySeconds() -> Void {
        print("locationManager stop Updating after 10 seconds")
        locationManager.stopUpdatingLocation()
    }

}

