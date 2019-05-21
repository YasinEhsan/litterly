//
//  RedeemPointsCell.swift
//  litterly
//
//  Created by Joyce Huang on 5/14/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

final class RedeemPointsCell: UITableViewCell {

    @IBOutlet weak var trashImage: UIImageView!
    @IBOutlet weak var pointsButton: UIButton!
    
    var actionBlock: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pointsButton.layer.cornerRadius = 10
        pointsButton.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onTapRedeem(_ sender: UIButton) {
        actionBlock?()
    }
    
}
