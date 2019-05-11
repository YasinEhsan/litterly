//
//  PointsViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/26/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class PointsViewController: UIViewController {

    @IBOutlet weak var redeemButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func roundButtonCorners(){
        redeemButton.layer.cornerRadius = CGFloat(12.0)
    }
    
    @IBAction func redeemOnTap(_ sender: Any) {
        
    }
    
}
