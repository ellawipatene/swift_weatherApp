//
//  locationManager.swift
//  Weather
//
//  Created by Ella Wipatene on 11/07/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    @Published var isLoading = false
    @Published var location: CLLocationCoordinate2D?
    // The '?' means that it is optional
    
   
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: ", error)
        isLoading = false
    }
}
