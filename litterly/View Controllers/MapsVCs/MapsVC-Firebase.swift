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
    func giveMeAMarker(for location:CLLocationCoordinate2D, on trashType:String, and isMeetupScheduled:Bool) -> GMSMarker{
        
        let customMarker = GMSMarker(position: location)
        
        if trashType == "organic"{
            if isMeetupScheduled{
                customMarker.icon = self.scheduledOrganicMarkerIcon
            }else{
                customMarker.icon = self.organicMarkerIcon
            }
            
            return customMarker
        } else if trashType == "plastic"{
            if isMeetupScheduled{
                customMarker.icon = self.scheduledPlasticMarkerIcon
            }else{
                customMarker.icon = self.plasticMarkerIcon
            }
            
            return customMarker
        } else {
            if isMeetupScheduled{
                customMarker.icon = self.scheduledMetalMarkerIcon
            }else{
                customMarker.icon = self.metalMarkerIcon
            }
            
            return customMarker
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
                    
                    let isMeetupScheduled = self.trashModelArray.last!.is_meetup_scheduled
                    print(isMeetupScheduled)
                    
                    let position = CLLocationCoordinate2D(latitude: self.trashModelArray.last!.lat, longitude: self.trashModelArray.last!.lon)
                    let trashType = self.trashModelArray.last!.trash_type
                    let marker = self.giveMeAMarker(for: position, on: trashType, and: isMeetupScheduled)

                    marker.opacity = 0.8
                    //appends to marker tracking array
                    self.markers.append(marker)
                    marker.map = self.mapView
                    
                    print("TYPE ADDED->> \(diff.document.data())")
                    
                    //if removed (when a clean up is complete, add a ghost trail of the previous marker
                } else if diff.type == .removed{
                    
                   //gotta handle remove event responsibly
                    //reload both of the arrays??
                    
                    
                  
                    
                    //or modified an existing one (when a cleanup is scheduled)
                } else if diff.type == .modified{
                    
                    
                    //TODO: Marker issue is here!!!!!!!!!!!!!!!!!
                    
                    //getting the modified doc's info
                    let modifiedDocId = diff.document.documentID
                    let modifiedDocNewIndex = diff.newIndex
                    let modifiedDocOldIndex = Int(diff.oldIndex)
                    print("docid, oldIndex, newIndex")
                    print(modifiedDocId, modifiedDocOldIndex, modifiedDocNewIndex)
                    print(self.trashModelArray[modifiedDocOldIndex].is_meetup_scheduled)
                    
                    //setting the modded document's marker to nil
                    self.markers[modifiedDocOldIndex].map = nil
                    
                    self.oldTappedArrayElement = self.tappedArrayElement
                    
                    //setting the old trash array up with the new value
                    self.trashModelArray[modifiedDocOldIndex] = TrashDataModel(dictionary: diff.document.data())!
                    
                    NotificationCenter.default.post(name: NSNotification.Name("tappedArrayElement-reloaded"), object: nil)
                    
                    //passing the new values and plotting the marker again
                    let isMeetupScheduled = self.trashModelArray[modifiedDocOldIndex].is_meetup_scheduled
                    print(isMeetupScheduled)
                    
                    let position = CLLocationCoordinate2D(latitude: self.trashModelArray[modifiedDocOldIndex].lat, longitude: self.trashModelArray[modifiedDocOldIndex].lon)
                    let trashType = self.trashModelArray[modifiedDocOldIndex].trash_type
                    let marker = self.giveMeAMarker(for: position, on: trashType, and: isMeetupScheduled)
                    
                    marker.opacity = 0.8
                    self.markers[modifiedDocOldIndex] = marker
                    marker.map = self.mapView
                    
                    print("TYPE MODDED ->>>\(diff.document.data())")
                    
                }
            }
        }
    }
    
}
