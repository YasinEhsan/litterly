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
        
        //let dict:[String:Any] = sharedValue.meetupDict as [String:Any]

    }
    
    

}
