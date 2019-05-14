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
    
}
