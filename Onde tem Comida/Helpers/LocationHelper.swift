//
//  LocationHelper.swift
//  Onde tem Comida
//
//  Created by Gabriel De Andrade Cordeiro on 19/07/21.
//

import Foundation
import CoreLocation

public class LocationHelper: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var locationCallback: ((CLLocation?) -> Void)!
    var locationServicesEnabled = false
    var didFailWithError: Error?

    public func run(callback: @escaping (CLLocation?) -> Void) {
        locationCallback = callback
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startMonitoringSignificantLocationChanges()
        locationServicesEnabled = CLLocationManager.locationServicesEnabled()
        DispatchQueue.main.async{
            if self.locationServicesEnabled {
                self.manager.startUpdatingLocation()
            }
            else { self.locationCallback(nil) }
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationCallback(locations.last!)
        manager.stopUpdatingLocation()
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        didFailWithError = error
        locationCallback(nil)
        manager.stopUpdatingLocation()
    }
}
