//
//  PointsHistoryCell.swift
//  litterly
//
//  Created by Joyce Huang on 5/16/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class PointsHistoryCell: UITableViewCell {

    @IBOutlet weak var lineView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
