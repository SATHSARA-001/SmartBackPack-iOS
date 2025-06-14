//
//  LocationManager.swift
//  NIBMParking
//
//  Created by Shanuri Vimansa on 2021-11-19.
//

import Foundation
import MapKit

class LocationManager: NSObject,ObservableObject {
   
    private let locationManager = CLLocationManager()
    @Published var location:CLLocation?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations .last else{
            return
        }
        
        self.location = location
        
    }
}
