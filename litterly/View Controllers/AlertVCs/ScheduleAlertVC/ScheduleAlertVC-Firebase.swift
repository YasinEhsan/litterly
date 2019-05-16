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
    
    //add to the meetups collections with a specefied id
    func createAMeetup(with dictionary: [String:Any], for id:String){
        
        sharedValue.db.collection("Meetups").document("\(id)").setData(dictionary) { (error:Error?) in
            if let err = error {
                print("Error writing document: \(err)")
            } else {
                print("meetup created successfully!")
            }
            
        }
        
    }
    
    //update meetup property of a marker with a specifice id
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
    
    //append to the confirmedUsers array
    func appendToConfirmedUsers(for meetupId:String, user_id:String, user_pic_url:String){
        //get parent's reference
        let ref = sharedValue.db.collection("Meetups").document("\(meetupId)")
        
        ref.updateData([
            "confirmed_users": FieldValue.arrayUnion([["user_id" : "\(user_id as String)", "user_pic_url" : "\(user_pic_url as String)"]])
            ])
    }
    
}