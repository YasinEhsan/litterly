//
//  MapsVC-GMSDelegate.swift
//  litterly
//
//  Created by Joy Paul on 5/1/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import Foundation
import GoogleMaps
import CoreLocation


extension MapsViewController: GMSMapViewDelegate{
    
    //gets lat and lon for tapped marker
    //configures a new marker and it's info window
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("tapped on marker with lat: \(marker.position.latitude)")
        print("tapped on marker with lon: \(marker.position.longitude)")
        
        tappedMarker = marker.position
        
        let position = marker.position
        mapView.animate(toLocation: position)
        let point = mapView.projection.point(for: position)
        let newPoint = mapView.projection.coordinate(for: point)
        let camera = GMSCameraUpdate.setTarget(newPoint)
        mapView.animate(with: camera)
        
        setupViewForUnscheduled()
        
        markerInfoWindow.center = mapView.projection.point(for: position)
        mapView.addSubview(markerInfoWindow)
        
        return false
    }
    
    //returns a UIView that we will customize and add to subView
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        return UIView()
    }
    
    //sets up for unscheduled info Window
    func setupViewForUnscheduled(){
        markerInfoWindow.layer.backgroundColor = UIColor.mainBlue.cgColor
        markerInfoWindow.layer.cornerRadius = 12
        markerInfoWindow.titleLabel.textColor = UIColor.textWhite
        markerInfoWindow.userActionButton.backgroundColor = UIColor.trashOrange
        markerInfoWindow.userActionButton.layer.cornerRadius = 12
    }
    
    //onTap on mapView remove the custom info view from superview
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        markerInfoWindow.removeFromSuperview()
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let position = tappedMarker
        if position != nil{
            //controling the spped of the view popping in with the animation
            UIView.animate(withDuration: 0.10, delay: 0, options: .showHideTransitionViews, animations: {
                self.markerInfoWindow.center = mapView.projection.point(for: position!)
                self.markerInfoWindow.center.y -= 100
            }, completion: nil)
            
        }
    }
}
