//
//  MapsVCLocationServices.swift
//  litterly
//
//  Created by Joy Paul on 4/18/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import GoogleMaps
import UIKit
import CoreLocation

//contains all the location permission related cods

extension MapsViewController: CLLocationManagerDelegate{
    
    //check if the location service is actually enabled, if yeah then setup location manager and check the location authorizations
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManger()
            checkLocationAuthorization()
        } else{
            //show an alert to let people kn ow that location services are not enabled
            //checkLocationAuthorization()
        }
    }
    
    
    //sets up location manager. Call when location services are enabled
    func setupLocationManger(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    
    
    //the levels of location authorization and what to do
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
            
        //only gets location when the app is open, the ideal condition
        case .authorizedWhenInUse:
            //centering the mapView on device's location
            centersCameraOnDevice()
            break
        //when user hasn't picked an allow or not allow auth option, ideal to ask for permission here
        case .notDetermined:
            //requesting when in use permission of location tracking
            locationManager.requestWhenInUseAuthorization()
            break
        //location services can be blocked by the device admin and user can't turn it on/off
        case .restricted:
            //display an alert letting them know what is going on
            break
        //once denied permission, user has to manually enable permissions again
        case .denied:
            //show an alert to let them know how to authorize again
            break
        case .authorizedAlways:
            break
        @unknown default:
            print("Unknown value")
            fatalError()
        }
    }
    
    
    //camera helps center the position of the view, will use user's current location
    func centersCameraOnDevice(){
        if let location = locationManager.location?.coordinate{
            print(location.latitude)
            print(location.longitude)
            
            let camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitude, zoom: 17.0)
            mapView?.animate(to: camera)
            mapView?.isMyLocationEnabled = true
            
            locationManager.startUpdatingLocation()
        }
    }
    
    //func to call after location from the user is taken
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        
        mapView?.animate(to: camera)
        
        locationManager.startUpdatingLocation()
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        locationManager.stopUpdatingLocation()
        mapView?.isMyLocationEnabled = false
        
    }
    
    //if auth changed, run through the switch case statements
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}