//
//  RedeemPointsCell.swift
//  litterly
//
//  Created by Joyce Huang on 5/14/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class RedeemPointsCell: UITableViewCell {

    @IBOutlet weak var trashImage: UIImageView!
    @IBOutlet weak var pointsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ imageName: String, button: UIButton) {
        trashImage.image = UIImage(named: "trash-can")
        pointsButton = button
    }
    
}
