//
//  MeetupViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/18/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit
import Cards

class MeetupViewController: UIViewController {
    
    @IBOutlet weak var organicsCard: CardGroup!
    @IBOutlet weak var plasticGroup: CardGroup!
    @IBOutlet weak var electronicsGroup: CardGroup!
    @IBOutlet weak var paperGroup: CardGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        organicsCard.title = "Organics"
        organicsCard.subtitle = "150 events"
        
        plasticGroup.title = "Plastic"
        plasticGroup.subtitle = "90 events"
        
        electronicsGroup.title = "Electronics"
        electronicsGroup.subtitle = "50 events"
        
        paperGroup.title = "Paper"
        paperGroup.subtitle = "128 topics - 4k articles"
        
        let organicsCardContent = storyboard?.instantiateViewController(withIdentifier: "CardContent")
        organicsCard.shouldPresent(organicsCardContent, from: self)

        let plasticCardContent = storyboard?.instantiateViewController(withIdentifier: "CardContent")
        plasticGroup.shouldPresent(plasticCardContent, from: self)

        let electronicsCardContent = storyboard?.instantiateViewController(withIdentifier: "CardContent")
        electronicsGroup.shouldPresent(electronicsCardContent, from: self)

        let paperCardContent = storyboard?.instantiateViewController(withIdentifier: "CardContent")
        paperGroup.shouldPresent(paperCardContent, from: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
