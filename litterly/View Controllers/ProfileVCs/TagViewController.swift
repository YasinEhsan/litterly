//
//  TagViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/26/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class TagViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var trashMeetUpsView: UITableView!
    
    var address = ["14 St Union Sq", "42 St Bryant Park"]
    var event = ["Compost Meetup", "Plastics Meetup"]
    let identifier = "TrashMeetUpsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trashMeetUpsView.dataSource = self
        trashMeetUpsView.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TrashMeetUpsCell
        
        cell.iconParentView.layer.cornerRadius = 12
        cell.iconParentView.backgroundColor = UIColor.unselectedGrey
        
        cell.iconImageView.setImage(UIImage(named: "icons8-gears-100"), for: .normal)
        
        cell.addressLabel.text = address[indexPath.row]
        cell.eventTitleLabel.text = event[indexPath.row]
        
        return cell
    }

}
