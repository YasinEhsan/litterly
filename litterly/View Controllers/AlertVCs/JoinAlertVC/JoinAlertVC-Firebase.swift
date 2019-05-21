//
//  JoinAlertVC-Firebase.swift
//  litterly
//
//  Created by Joy Paul on 5/20/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import Foundation
import FirebaseFirestore

extension JoinAlertViewController{
    
    //append to the confirmedUsers array
    func appendToConfirmedUsers(for meetupId:String, user_id:String, user_pic_url:String){
        //get parent's reference
        let ref = sharedValue.db.collection("Meetups").document("\(meetupId)")
        
        ref.updateData([
            "confirmed_users": FieldValue.arrayUnion([["user_id" : "\(user_id as String)", "user_pic_url" : "\(user_pic_url as String)"]])
            ])
    }
    
    //get meetup details
    func meetupDetailsFromFirestore(for meetupId:String){
        
        let ref = sharedValue.db.collection("Meetups").document("\(meetupId)")
        
        ref.getDocument { (document, error) in
            
            let address = document?.data()!["meetup_address"]
            let meetup_date_time = document?.data()!["meetup_date_time"]
            let confirmed_users = document?.data()!["confirmed_users"] as! [[String:String]]
            
            self.meetupAddress.fadeTransition(0.4)
            self.meetupAddress.text = address as! String
            
            self.meetupDateAndTime.fadeTransition(0.4)
            self.meetupDateAndTime.text = meetup_date_time as! String
            
            self.confirmedUsers = confirmed_users
            
            self.attendingUserCollectionView.reloadData()
        }

        
    }
}
