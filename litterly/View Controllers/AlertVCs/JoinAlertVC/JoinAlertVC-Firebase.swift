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
    
    //check if user has already joined
    func didUserAlreadyJoin(for meetupId:String, check userEmail:String){
        
        let ref = sharedValue.db.collection("Meetups").document("\(meetupId)")
        
        ref.getDocument { (document, error) in
            
            //why nil????????
            self.meetupDetails = MeetupDataModel(dictionary: (document?.data())!)
            print(self.meetupDetails)
        }

        
    }
}
