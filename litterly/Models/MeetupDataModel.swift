//
//  MeetupDataModel.swift
//  litterly
//
//  Created by Joy Paul on 5/13/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import Foundation


struct MeetupDataModel{
    
    var marker_lat: Double
    var marker_lon: Double
    var meetup_address: String
    //var neighborhood: String
    var meetup_date: String
    var meetup_time: String
    var type_of_trash: String
    var author_id: String
    var author_display_name: String
    
    var dictionary:[String: Any]{
        return [
            "marker_lat" : marker_lat,
            "marker_lon": marker_lon,
            "meetup_address": meetup_address,
            "meetup_date": meetup_date,
            "meetup_time": meetup_time,
            "type_of_trash": type_of_trash,
            "author_id": author_id,
            "author_display_name": author_display_name
        ]
    }
}

//extending firestore's DocSerializable type to init a dictionary
extension MeetupDataModel: DocumentSerializable{
    
    init?(dictionary: [String : Any]) {
        //guard let to make sure we don't run into nil values
        guard let marker_lat = dictionary["marker_lat"] as? Double,
            let marker_lon = dictionary["marker_lon"] as? Double,
            let meetup_address = dictionary["meetup_address"] as? String,
            let meetup_date = dictionary["meetup_date"] as? String,
        let meetup_time = dictionary["meetup_time"] as? String,
        let type_of_trash = dictionary["type_of_trash"] as? String,
        let author_id = dictionary["author_id"] as? String,
        let author_display_name = dictionary["author_display_name"] as? String else {return nil}
        
        self.init(marker_lat: marker_lat, marker_lon: marker_lon, meetup_address: meetup_address, meetup_date: meetup_date, meetup_time: meetup_time, type_of_trash: type_of_trash, author_id: author_id, author_display_name: author_display_name)
    }
}
