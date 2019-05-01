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
                    let trashType = self.trashModelArray.last!.trash_type
                    let marker = self.giveMeAMarker(for: position, on: trashType)
                    
                    marker.opacity = 0.6
                    marker.map = self.mapView
                }
            }
        }
    }
    
    //a listener for markers in real time from other users
    func realTimeMarkerListener(){
        db.collection("TaggedTrash").addSnapshotListener{
            QuerySnapshot, Error in
            
            //chceking if the database we query for is empty
            guard let snapShot = QuerySnapshot else {return}
            
            snapShot.documentChanges.forEach{
                diff in
                
                //if added
                if diff.type == .added{
                    //self.trashModelArray.append(TrashDataModel(dictionary: diff.document.data())!)
                    
                    print("Document diff gets called")
                    
                    
                    self.trashModelArray.append(TrashDataModel(dictionary: diff.document.data())!)

                    let position = CLLocationCoordinate2D(latitude: self.trashModelArray.last!.lat, longitude: self.trashModelArray.last!.lon)
                    let trashType = self.trashModelArray.last!.trash_type
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
