//
//  ScheduledMarkerInfoWindow.swift
//  litterly
//
//  Created by Joy Paul on 5/9/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class ScheduledMarkerInfoWindow: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userActionButton: UIButton!
    
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        print("Yee have tapped the button!")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //loads view from xib file
    func loadView() -> ScheduledMarkerInfoWindow{
        let scheduledInfoWindow = Bundle.main.loadNibNamed("ScheduledMarkerInfoWindow", owner: self, options: nil)?[0] as! ScheduledMarkerInfoWindow
        
        return scheduledInfoWindow
    }

}
