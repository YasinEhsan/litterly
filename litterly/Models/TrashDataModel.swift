//
//  TrashDataModel.swift
//  litterly
//
//  Created by Joy Paul on 4/19/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

//this is a struct for our trash data model
//we store the properties of trash data model that we send to/ receive from firestore
//we use protocol to effortlessly sticth the values we pass to this model into a dictionary

import Foundation
import FirebaseFirestore

//the protocol
protocol DocumentSerializable {
    init?(dictionary: [String:Any])
}

struct TrashDataModel{
    
    var lat: Double
    var lon: Double
    var trashType: String
    
    var dictionary:[String: Any]{
        return [
            "lat" : lat,
            "lon" : lon,
            "trashType" : trashType
        ]
    }
}

//extending firestore's DocSerializable type to init a dictionary
extension TrashDataModel: DocumentSerializable{
    
    init?(dictionary: [String : Any]) {
        //guard let to make sure we don't run into nil values
        guard let lat = dictionary["lat"] as? Double,
            let lon = dictionary["lon"] as? Double,
            let trashType = dictionary["trashType"] as? String else{return nil}
        
        self.init(lat: lat, lon: lon, trashType: trashType)
    }
}
