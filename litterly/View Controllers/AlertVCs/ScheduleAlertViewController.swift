//
//  ScheduleAlertViewController.swift
//  litterly
//
//  Created by Joy Paul on 5/9/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class ScheduleAlertViewController: UIViewController {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var organicButton: UIButton!
    @IBOutlet weak var plasticButton: UIButton!
    @IBOutlet weak var metalButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var meetupdatePicker: UIDatePicker!
    
    let cornerRadius:CGFloat = 12.0
    let nc = NotificationCenter.default
    let sharedValue = SharedValues.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundsCorners()
        configuresColors()
        
        //use notification center to get the selected trash type
    }

    func roundsCorners(){
        parentView.layer.cornerRadius = cornerRadius
        organicButton.layer.cornerRadius = cornerRadius
        plasticButton.layer.cornerRadius = cornerRadius
        metalButton.layer.cornerRadius = cornerRadius
        cancelButton.layer.cornerRadius = cornerRadius
        createButton.layer.cornerRadius = cornerRadius
    }
    
    func configuresColors(){
        self.view.backgroundColor = UIColor.unselectedGrey.withAlphaComponent(0.35)
        parentView.backgroundColor = UIColor.mainBlue
        organicButton.backgroundColor = UIColor.unselectedGrey
        plasticButton.backgroundColor = UIColor.unselectedGrey
        metalButton.backgroundColor = UIColor.unselectedGrey
        createButton.backgroundColor = UIColor.mainGreen
        cancelButton.backgroundColor = UIColor.unselectedGrey
        meetupdatePicker.setValue(UIColor.textWhite, forKey: "textColor")
    }

    
    @IBAction func onCancelTap(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateTap(_ sender: UIButton) {
        let id:String = ("\(sharedValue.meetupDict.lat)+\(sharedValue.meetupDict.lon)+meetup")
        
        let dict:MeetupDataModel = MeetupDataModel(marker_lat: sharedValue.meetupDict.lat, marker_lon: sharedValue.meetupDict.lon, meetup_address: sharedValue.meetupDict.street_address, meetup_date: "1111", meetup_time: "9pm", type_of_trash: sharedValue.meetupDict.trash_type, author_id: "\(sharedValue.currentUserEmail as! String)", author_display_name: sharedValue.currentUserDisplayName as! String, confirmed_users: ["\(sharedValue.currentUserEmail as! String)"])
        
        createAMeetup(with: dict.dictionary, for: id)
        
        updateMeetupProperty(for: "\(sharedValue.meetupDict.id)", with: true)
        
        fetchStuff(for: "\(sharedValue.currentUserEmail as! String)")

    }
    
    

}
