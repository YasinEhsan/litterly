//
//  JoinAlertViewController.swift
//  litterly
//
//  Created by Joy Paul on 5/20/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class JoinAlertViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var meetupHeader: UILabel!
    @IBOutlet weak var meetupAddress: UILabel!
    @IBOutlet weak var meetupDateAndTime: UILabel!
    @IBOutlet weak var collectionViewHeader: UILabel!
    @IBOutlet weak var attendingUserCollectionView: UICollectionView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    
    let cornerRadiusValue = 12
    let sharedValue = SharedValues.sharedInstance
    var meetupDetails:MeetupDataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColors()
        roundCorners()
        queryForUser()

        attendingUserCollectionView.dataSource = self
        attendingUserCollectionView.delegate = self
    }
    
    func setupColors(){
        self.view.backgroundColor = UIColor.unselectedGrey.withAlphaComponent(0.35)
        parentView.backgroundColor = UIColor.mainBlue
        meetupHeader.textColor = UIColor.trashOrange
        meetupDateAndTime.textColor = UIColor.joinAlertGrey
        attendingUserCollectionView.backgroundColor = UIColor.mainBlue
        joinButton.backgroundColor = UIColor.mainGreen
        cancelButton.backgroundColor = UIColor.mainGreen
    }
    
    func roundCorners(){
        parentView.layer.cornerRadius = 12
        cancelButton.layer.cornerRadius = 12
        joinButton.layer.cornerRadius = 12
    }
    
    @IBAction func onCancelTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onJoinTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func queryForUser(){
        let meetupId = ("\(sharedValue.meetupDict.lat)\(sharedValue.meetupDict.lon)meetup")
        
        didUserAlreadyJoin(for: meetupId, check: sharedValue.currentUserEmail! as String)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PeopleAttendingCollectionViewCell", for: indexPath) as! PeopleAttendingCollectionViewCell
        
        cell.attendingUserProfileImages.image = UIImage(named: "userPhoto")
        cell.attendingUserProfileImages.contentMode = .scaleAspectFill
        cell.attendingUserProfileImages.isOpaque = false
        cell.attendingUserProfileImages.layer.borderWidth = 1
        cell.attendingUserProfileImages.layer.masksToBounds = false
        cell.attendingUserProfileImages.layer.borderColor = UIColor.searchBoxTextGray.cgColor
        cell.attendingUserProfileImages.layer.cornerRadius = cell.attendingUserProfileImages.frame.height/2
        cell.attendingUserProfileImages.clipsToBounds = true
        
        return cell
    }
    
}
