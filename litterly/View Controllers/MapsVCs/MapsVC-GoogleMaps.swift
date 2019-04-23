//
//  GoogleMapsViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/9/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import FirebaseFirestore

extension MapsViewController {
    
    //init the GMS view **must check for internet connection first**
    func initMapView(){
        
        if let location = locationManager.location?.coordinate{
            print(location.latitude)
            print(location.longitude)
            
            let camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitude, zoom: 13.0)
            //***note the value 86, it is the height of the handleArea and the map's view must end before it touches handle area
            mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 86), camera: camera)
            
            getMarkersFromFireStore()
            realTimeMarkerListener()
            
            //adding the mapsView as subview to the parent view
            self.view.addSubview(mapView!)
            locateMeButton()
            
        } else { //else pass a default coordinate to center the location
            mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 86), camera: GMSCameraPosition.camera(withLatitude: 40.74069, longitude: -73.983114, zoom: 15))
            
            getMarkersFromFireStore()
            realTimeMarkerListener()
            
            self.view.addSubview(mapView!)
            locateMeButton()
        }
        
    }
    
    //add a button to help center the screen position on device location
    func locateMeButton(){
        let gpsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 52, height: 52))
        gpsButton.backgroundColor = UIColor.textWhite
        
        gpsButton.setImage(UIImage(named: "52gps"), for: .normal)
        
        gpsButton.translatesAutoresizingMaskIntoConstraints = false
        mapView?.addSubview(gpsButton)
        
        gpsButton.addTarget(self, action: #selector(onLocateMeTap(sender:)), for: .touchUpInside)
        
        
        gpsButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        gpsButton.bottomAnchor.constraint(equalTo: mapView!.bottomAnchor, constant: -16).isActive = true
        gpsButton.rightAnchor.constraint(equalTo: mapView!.rightAnchor, constant: -16).isActive = true
        
        gpsButton.layer.cornerRadius = 12
        gpsButton.layer.shadowRadius = 50
        gpsButton.layer.shadowColor = UIColor.searchBoxShadowColor.cgColor
    }
    
    @objc func onLocateMeTap(sender: UIButton){
        print("locate me tapped")
        checkLocationServices()
    }
    
    //gets all the trash markers from the database
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
                    
                    let marker = GMSMarker()
                    
                    marker.position.latitude = self.trashModelArray.last!.lat
                    marker.position.longitude = self.trashModelArray.last!.lon
                    marker.title = self.trashModelArray.last?.trashType
                    marker.snippet = "Placeholder snippet"
                    
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
                    
                    let marker = GMSMarker()
                    
                    marker.position.latitude = self.trashModelArray.last!.lat
                    marker.position.longitude = self.trashModelArray.last!.lon
                    marker.title = self.trashModelArray.last?.trashType
                    marker.snippet = "Placeholder snippet"
                    
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
