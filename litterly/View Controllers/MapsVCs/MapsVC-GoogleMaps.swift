//
//  GoogleMapsViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/9/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit
import GoogleMaps

extension MapsViewController {
    
    //init the GMS view **must check for internet connection first**
    func initMapView(){
        //***note the value 86, it is the height of the handleArea and the map's view must end before it touches handle area
        mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 86), camera: GMSCameraPosition.camera(withLatitude: 40.74069, longitude: -73.983114, zoom: 15))
        
        createMapMarkers(with: "stuff", with: "stuff caption", with: CLLocationCoordinate2D(latitude: 40.740666, longitude: -73.984691))
        
        //adding the mapsView as subview to the parent view
        self.view.addSubview(mapView!)

    }
    
    //creates markers on lat, lon and with title and sinppet
    func createMapMarkers(with title: String, with snippet: String, with latandlon: CLLocationCoordinate2D){
        // init marker variable
        let marker = GMSMarker()
        
        //specify the positions (lat and lon)
        marker.position = latandlon
        
        //any title and text you need
        marker.title = "\(title)"
        marker.snippet = "\(snippet)"
        
        //map the marker
        marker.map = mapView
    }
 
}
