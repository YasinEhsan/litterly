//
//  UnscheduledMarkerWindow.swift
//  litterly
//
//  Created by Joy Paul on 4/28/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//
import UIKit

class MarkerInfoWindow: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userActionButton: UIButton!
    var view: UIView!
    
    //button's function
    @IBAction func onTapUserAction(_ sender: UIButton) {
        print("You have pressed the markerView Button")
        userActionButton.backgroundColor = UIColor.mainGreen
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //loads view from xib file
    func loadView() -> MarkerInfoWindow{
        let customInfoWindow = Bundle.main.loadNibNamed("MarkerInfoWindow", owner: self, options: nil)?[0] as! MarkerInfoWindow
        
        return customInfoWindow
    }
    
}
