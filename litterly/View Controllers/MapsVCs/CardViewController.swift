//
//  CardViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/8/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    //all the outlets for the cardView controller
    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var cardViewArea: UIView!
    @IBOutlet weak var litterlySign: UILabel!
    @IBOutlet weak var nearbySign: UILabel!
    @IBOutlet weak var nearbySignSubTitle: UILabel!
    @IBOutlet weak var nearByCount: UILabel!
    @IBOutlet weak var trashType1: UIButton!
    @IBOutlet weak var trashType2: UIButton!
    @IBOutlet weak var trashType3: UIButton!
    @IBOutlet weak var reportTrashButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpWidgetColors()
        roundButtonCorners()
    }

    //rounds the button's corners
    func roundButtonCorners(){
        let roundValue = CGFloat(12.0)
        
        trashType1.layer.cornerRadius = roundValue
        trashType2.layer.cornerRadius = roundValue
        trashType3.layer.cornerRadius = roundValue
        reportTrashButton.layer.cornerRadius = roundValue
    }
    
    //sets up all the widgets with their corresponding colors
    func setUpWidgetColors(){
        handleArea.backgroundColor = UIColor.slideInCardBlue
        cardViewArea.backgroundColor = UIColor.slideInCardBlue
        nearbySign.textColor = UIColor.slideInCardTextWhite
        nearbySignSubTitle.textColor = UIColor.slideInCardTextWhite
        nearByCount.textColor = UIColor.reportTrashGreen
        litterlySign.textColor = UIColor.slideInCardTextWhite
        trashType1.backgroundColor = UIColor.unSelectedTrashTypeGrey
        trashType2.backgroundColor = UIColor.unSelectedTrashTypeGrey
        trashType3.backgroundColor = UIColor.unSelectedTrashTypeGrey
        reportTrashButton.backgroundColor = UIColor.reportTrashGreen
    }
    
    //the trash type buttons, user must select one
    @IBAction func trashType1ButtonOnTap(_ sender: UIButton) {
        trashType1.isSelected = !trashType1.isSelected
    }
    
    @IBAction func trashType2ButtonOnTap(_ sender: SelectedButton) {
        trashType2.isSelected = !trashType2.isSelected
    }
    
    @IBAction func trashType3ButtonOnTap(_ sender: SelectedButton) {
        trashType3.isSelected = !trashType3.isSelected
    }
    
    //func that will request lat, lon, trash type in order to got to the next steps of reporting trash
    @IBAction func reportTrashButtonOnTap(_ sender: UIButton) {
        //make a request to the firebase server
    }
    
    

}
