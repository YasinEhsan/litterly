//
//  EmbeddedTableViewCell.swift
//  litterly
//
//  Created by Joyce Huang on 4/25/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class EmbeddedTableViewCell: UITableViewCell {
    
    // Cell components
    @IBOutlet weak var timelineView: UIView!
    @IBOutlet weak var overlayIconView: UIView!
    @IBOutlet weak var overlayTitleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var overlayViewChildImageview: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       setupCellTimeline()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCellTimeline()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCellTimeline() {
        
        
        if let timelineviewAvail = timelineView, let overlayView = overlayIconView, let eventLabel = overlayTitleLabel, let iconImage = iconView {
           

            timelineviewAvail.translatesAutoresizingMaskIntoConstraints = false
          

            // constraints for line
            timelineviewAvail.widthAnchor.constraint(equalToConstant: 2).isActive = true
            timelineviewAvail.heightAnchor.constraint(equalToConstant: self.bounds.height).isActive = true

            // Square View for the icon & label
            overlayView.translatesAutoresizingMaskIntoConstraints = false
            overlayView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            overlayView.widthAnchor.constraint(equalToConstant: (200)).isActive = true
            overlayView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
            overlayView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -100).isActive = true
            
            // Icon
            iconImage.translatesAutoresizingMaskIntoConstraints = false
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100).isActive = true
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
            
            // Event Label under icon
            eventLabel.translatesAutoresizingMaskIntoConstraints = false
            eventLabel.topAnchor.constraint(equalTo: iconImage.topAnchor, constant: 5).isActive = true
            
            
        }
        
        
        
    }
    
    
    override func layoutSubviews() {
        overlayIconView.layer.cornerRadius = 7
    }

}


