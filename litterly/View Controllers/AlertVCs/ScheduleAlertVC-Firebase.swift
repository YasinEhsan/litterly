//
//  AlertVC-Firebase.swift
//  litterly
//
//  Created by Joy Paul on 5/13/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import Foundation
import FirebaseFirestore

extension ScheduleAlertViewController{
    
    func createAMeetup(with dictionary: [String:Any], for id:String){
        
        sharedValue.db.collection("Meetups").document("\(id)").setData(dictionary) { (error:Error?) in
            if let err = error {
                print("Error writing document: \(err)")
            } else {
                print("meetup created successfully!")
            }
            
        }
        
    }
    
    func updateMeetupProperty(for id:String, with value:Bool){
        sharedValue.db.collection("TaggedTrash").document("\(id)").updateData([
            "is_meetup_scheduled" : value
        ]) { (error:Error?) in
            if let err = error {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func fetchStuff(for id:String){
        let ref = sharedValue.db.collection("Meetups").whereField("confirmed_users", arrayContains: "\(id)")
        
        ref.getDocuments(){
            QuerySnapshot, Error in
            
            //self.userTaggedTrash = (QuerySnapshot!.documents.compactMap({TrashDataModel(dictionary: $0.data())}))
            
            guard let snapShot = QuerySnapshot else {return}
            
            snapShot.documents.forEach{
                data in
                
                let x = data.data() as [String:Any]
                let y = x["confirmed_users"] as! [String]
                
                print(y)
            }
            
            
        }
        
        //TODO add to this array
        
        
        
    }
    
}
