//
//  MapsVC-Firebase.swift
//  litterly
//
//  Created by Joy Paul on 4/26/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//
import UIKit
import GoogleMaps
import CoreLocation
import FirebaseFirestore

extension MapsViewController{
    
    //returns a custom map marker based on trashType
    func giveMeAMarker(for location:CLLocationCoordinate2D, on trashType:String) -> GMSMarker{
        
        let customMarker = GMSMarker(position: location)
        
        if trashType == "organic"{
            customMarker.icon = self.organicMarkerIcon
            customMarker.title = "\(trashType)"
            customMarker.snippet = "location details: \(location.latitude) and \(location.longitude)"
            
            return customMarker
        } else if trashType == "plastic"{
            customMarker.icon = self.plasticMarkerIcon
            customMarker.title = "\(trashType)"
            customMarker.snippet = "location details: \(location.latitude) and \(location.longitude)"
            
            return customMarker
        } else{
            customMarker.icon = self.metalMarkerIcon
            customMarker.title = "\(trashType)"
            customMarker.snippet = "location details: \(location.latitude) and \(location.longitude)"
            
            return customMarker
        }
        
    }
    
    
    //gets all the trash markers from the database
    //****not necessary when realTimeMarker listener has been implemented........???
    func getMarkersFromFireStore(){
        db.collection("reportedTrash").getDocuments(){
            querySnapshot, error in
            
            if let error = error{
                //show an alert saying an error has occoured
                print(error.localizedDescription)
            } else{
                
                self.trashModelArray = (querySnapshot!.documents.compactMap({TrashDataModel(dictionary: $0.data())}))
                
                //print(self.trashModelArray)
                
                //chceking if the database we query for is empty
                guard let snapShot = querySnapshot else{return}
                
                snapShot.documents.forEach{
                    data in
                    
                    self.trashModelArray.append(TrashDataModel(dictionary: data.data())!)
                    
                    //print(self.trashModelArray)
                    
                    let position = CLLocationCoordinate2D(latitude: self.trashModelArray.last!.lat, longitude: self.trashModelArray.last!.lon)
                    let trashType = self.trashModelArray.last!.trashType
                    let marker = self.giveMeAMarker(for: position, on: trashType)
                    
                    marker.opacity = 0.6
                    marker.map = self.mapView
                }
            }
        }
    }
    
    //a listener for markers in real time from other users
    func realTimeMarkerListener(){
        db.collection("reportedTrash").addSnapshotListener{
            QuerySnapshot, Error in
            
            //chceking if the database we query for is empty
            guard let snapShot = QuerySnapshot else {return}
            
            snapShot.documentChanges.forEach{
                diff in
                
                //if added
                if diff.type == .added{
                    self.trashModelArray.append(TrashDataModel(dictionary: diff.document.data())!)
                    
                    let position = CLLocationCoordinate2D(latitude: self.trashModelArray.last!.lat, longitude: self.trashModelArray.last!.lon)
                    let trashType = self.trashModelArray.last!.trashType
                    let marker = self.giveMeAMarker(for: position, on: trashType)
                    
                    marker.opacity = 0.8
                    marker.map = self.mapView
                    
                    //if removed (when a clean up is complete, add a ghost trail of the previous marker
                } else if diff.type == .removed{
                    
                    //or modified an existing one (when a cleanup is scheduled)
                } else if diff.type == .modified{
                    
                }
            }
        }
    }
    
}

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
