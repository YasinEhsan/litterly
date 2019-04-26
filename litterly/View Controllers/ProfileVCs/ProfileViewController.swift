//
//  ProfileViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/5/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usrNameLabel: UILabel!
    @IBOutlet weak var usrCityLabel: UILabel!
    
    
    let segmentedCtrl = UISegmentedControl()
    let subViewForSegCtrl = UIView()
    let activeSegCtrlIndicator = UIView()
    let meetupHistoryLabel = UILabel()
    let containerView = UIView()
    
    //located in the views folder
    let tagVC:UIView = TagViewController().view
    let meetVC:UIView = MeetViewController().view
    let pointsVC:UIView = PointsViewController().view
    
    //tuples
    let tagAtt = (155, "TRASHTAG")
    let meetupAtt = (12, "MEETUPS")
    let pointsAtt = (800, "POINTS")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.profileViewGray
        
        configureNavbar()
        
        configureProfilePhoto()
        configureUsr()
        
        setUpSegCtrl()
        configureSegCtrlConstraints()
        customizeSegCtrl()
        
        configureMeetupHistoryLabel()
        
        addViewsForContainer()
        
        

    }
    
    //customize the nav bar
    func configureNavbar(){
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.barTintColor = UIColor.mainBlue
        navigationController?.navigationBar.backgroundColor = UIColor.mainBlue
        navigationController?.navigationBar.isTranslucent = true
        
        // create the button
        let backImage  = UIImage(named: "white_back_arrow")!.withRenderingMode(.alwaysOriginal)
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        backButton.setBackgroundImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(goBackToMap), for: .touchUpInside)
        
        // here where the magic happens, you can shift it where you like
        backButton.transform = CGAffineTransform(translationX: 0, y: 0)
        
        // add the button to a container, otherwise the transform will be ignored
        let backButtonContainer = UIView(frame: backButton.frame)
        backButtonContainer.addSubview(backButton)
        let leftNavButtonItem = UIBarButtonItem(customView: backButtonContainer)
        
        // add button shift to the side
        navigationItem.leftBarButtonItem = leftNavButtonItem
    }
    
    //back button onTap() func
    @objc func goBackToMap(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //sets up the labels
    func configureUsr(){
        usrNameLabel.text = "Cosmic Rover"
        usrCityLabel.textColor = UIColor.textWhite
        usrCityLabel.text = "New York City"
        usrCityLabel.textColor = UIColor.textWhite
    }
    
    //sets up the profile pic
    func configureProfilePhoto(){
        profileImageView.image = UIImage(named: "userPhoto")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.isOpaque = false
        
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.searchBoxTextGray.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
    }
    
    //creates a segCtrl
    func setUpSegCtrl(){
        
        //sets number of lines of text
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 2
        
        segmentedCtrl.insertSegment(withTitle: "\(tagAtt.0)\n\(tagAtt.1)", at: 0, animated: true)
        segmentedCtrl.insertSegment(withTitle: "\(meetupAtt.0)\n\(meetupAtt.1)", at: 1, animated: true)
        segmentedCtrl.insertSegment(withTitle: "\(pointsAtt.0)\n\(pointsAtt.1)", at: 2, animated: true)
        
        segmentedCtrl.selectedSegmentIndex = 0
    }
    
    //puts segCtrl inside a view and gives it constraints
    func configureSegCtrlConstraints(){
        segmentedCtrl.translatesAutoresizingMaskIntoConstraints = false
        subViewForSegCtrl.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 98)
        subViewForSegCtrl.backgroundColor = UIColor.textWhite
        subViewForSegCtrl.addSubview(segmentedCtrl)
        
        segmentedCtrl.topAnchor.constraint(equalTo: subViewForSegCtrl.topAnchor).isActive = true
        segmentedCtrl.bottomAnchor.constraint(equalTo: subViewForSegCtrl.bottomAnchor).isActive = true
        segmentedCtrl.leftAnchor.constraint(equalTo: subViewForSegCtrl.leftAnchor).isActive = true
        segmentedCtrl.rightAnchor.constraint(equalTo: subViewForSegCtrl.rightAnchor).isActive = true
        segmentedCtrl.heightAnchor.constraint(equalToConstant: 88).isActive = true
        
        subViewForSegCtrl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subViewForSegCtrl)
        
        subViewForSegCtrl.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        subViewForSegCtrl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        subViewForSegCtrl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        subViewForSegCtrl.heightAnchor.constraint(equalToConstant: 88).isActive = true
    }
    
    //customizes the view for seg ctrl and the ctrl itself
    func customizeSegCtrl(){
        segmentedCtrl.backgroundColor = UIColor.textWhite
        segmentedCtrl.tintColor = UIColor.textWhite
        
        activeSegCtrlIndicator.translatesAutoresizingMaskIntoConstraints = false
        activeSegCtrlIndicator.backgroundColor = UIColor.mainBlue
        subViewForSegCtrl.addSubview(activeSegCtrlIndicator)
        
        activeSegCtrlIndicator.topAnchor.constraint(equalTo: subViewForSegCtrl.bottomAnchor, constant: -5).isActive = true
        activeSegCtrlIndicator.heightAnchor.constraint(equalToConstant: 8.7).isActive = true
        activeSegCtrlIndicator.leftAnchor.constraint(equalTo: subViewForSegCtrl.leftAnchor).isActive = true
        activeSegCtrlIndicator.widthAnchor.constraint(equalTo: subViewForSegCtrl.widthAnchor, multiplier: 1 / CGFloat(segmentedCtrl.numberOfSegments)).isActive = true
        
        //configure subView's shadow
        subViewForSegCtrl.layer.borderColor = UIColor.searchBoxTextGray.cgColor
        subViewForSegCtrl.layer.shadowColor = UIColor.profileViewGray.cgColor
        subViewForSegCtrl.layer.shadowPath = UIBezierPath(rect: subViewForSegCtrl.bounds).cgPath
        subViewForSegCtrl.layer.shadowOpacity = 0.6
        subViewForSegCtrl.layer.shadowOffset = .zero
        
        //change text attribute for selected/unselected state
        segmentedCtrl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "MarkerFelt-Thin", size: 16)!,
            NSAttributedString.Key.foregroundColor: UIColor.searchBoxTextGray
            ], for: .normal)
        
        segmentedCtrl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "MarkerFelt-Thin", size: 16)!,
            NSAttributedString.Key.foregroundColor: UIColor.containerDividerGrey
            ], for: .selected)
        
        
        let responder = UIResponder()
        
        //we add a listener for the value being changed by passing the responder, an objective-C runtime func for the behavior valueChanged
        segmentedCtrl.addTarget(responder, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    //the history label text and settings
    func configureMeetupHistoryLabel(){
        meetupHistoryLabel.text = "Meetup History"
        meetupHistoryLabel.textColor = UIColor.searchBoxTextGray
        meetupHistoryLabel.font = UIFont(name: "MarkerFelt-Wide", size: 12)
        
        meetupHistoryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(meetupHistoryLabel)
        meetupHistoryLabel.topAnchor.constraint(equalTo: subViewForSegCtrl.bottomAnchor, constant: 19).isActive = true
        meetupHistoryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        meetupHistoryLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //meetupHistoryLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    //the views that will trigger on tap
    func addViewsForContainer(){
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: meetupHistoryLabel.bottomAnchor, constant: 12.4).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        containerView.addSubview(tagVC)
        containerView.addSubview(meetVC)
        containerView.addSubview(pointsVC)
    }
    
    //setting views for cases
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl){
        //we animate the buttonBar to go underneath the selected control
        UIView.animate(withDuration: 0.3) {
            self.activeSegCtrlIndicator.frame.origin.x = (self.segmentedCtrl.frame.width / CGFloat(self.segmentedCtrl.numberOfSegments)) * CGFloat(self.segmentedCtrl.selectedSegmentIndex)
        }
        
        switch segmentedCtrl.selectedSegmentIndex{
        case 0:
            containerView.bringSubviewToFront(tagVC)
        case 1:
            containerView.bringSubviewToFront(meetVC)
        case 2:
            containerView.bringSubviewToFront(pointsVC)
            
        default:
            print("Whaaa")
        }
        
    }
    
    

}
