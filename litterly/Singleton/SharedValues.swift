//
//  SharedValues.swift
//  litterly
//
//  Created by Joy Paul on 5/13/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

class SharedValues{
    
    private init() {}
    static let sharedInstance = SharedValues()
    
    let db = Firestore.firestore()
    
    var meetupDict:TrashDataModel!
    
    let currentUserDisplayName = Auth.auth().currentUser?.displayName
    let currentUserEmail = Auth.auth().currentUser?.email
    let currentUserProfileImageURL = Auth.auth().currentUser?.photoURL?.absoluteString
    
}
