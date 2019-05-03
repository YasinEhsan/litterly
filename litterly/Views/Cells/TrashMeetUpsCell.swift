//
//  TrashMeetUpsCell.swift
//  litterly
//
//  Created by Joyce Huang on 5/3/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class TrashMeetUpsCell: UITableViewCell {

    @IBOutlet weak var barLineView: UIImageView!
    @IBOutlet weak var iconParentView: UIView!
    @IBOutlet weak var iconImageView: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
