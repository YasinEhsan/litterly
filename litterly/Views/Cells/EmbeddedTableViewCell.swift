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
    @IBOutlet weak var timelineView : UIView?
    @IBOutlet weak var overlayIconView: UIView? // Rounded card-like overlay
    @IBOutlet weak var overlayTitleLabel: UILabel?
    @IBOutlet weak var iconView: UIImageView?
    @IBOutlet weak var leftOverlayedStackview: UIStackView?
    @IBOutlet weak var rightStackview: UIStackView?

    // These are in the right parent stack view
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //turnOffAllConstraintsfromComponents()
       
        // Important
        // setupCellTimeline()
        // new setupCellComponents()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // turnOffAllConstraintsfromComponents()
        // Important
        //setupCellTimeline()
        // new setupCellComponents()
      
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    override func setNeedsDisplay() {
        setupCellComponents()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func turnOffAllConstraintsfromComponents() {
//        timelineView.translatesAutoresizingMaskIntoConstraints = false
//        overlayIconView.translatesAutoresizingMaskIntoConstraints = false
//        leftOverlayedStackview.translatesAutoresizingMaskIntoConstraints = false
//        rightStackview.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupCellComponents() {
        
        print("New Method called")
        
        if let timelineview = timelineView {
            contentView.addSubview(timelineview)
            
            // Initializing the components that claim they are NIL
         
            timelineview.widthAnchor.constraint(equalToConstant: 10).isActive = true
            timelineview.heightAnchor.constraint(equalToConstant: self.bounds.height).isActive = true
        }
        // Add Subviews
       
      //  timelineView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 50).isActive = true
        
    }
    
    // FIXME: THIS IS NOT WORKING PROPERLY. Programmatic constraints don't seem to be making any changes
    func setupCellTimeline() {
        
        print("This method was called")
        
        if let timelineviewAvail = timelineView, let overlayView = overlayIconView, let eventLabel = overlayTitleLabel, let iconImage = iconView, let stackview = rightStackview {
           
            print("--> Optional method called")

            timelineviewAvail.translatesAutoresizingMaskIntoConstraints = false
            stackview.translatesAutoresizingMaskIntoConstraints = false

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
            
            // Constraints of the stackview
            self.contentView.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -30).isActive = true
            stackview.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
            stackview.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
            stackview.leadingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: 5).isActive = true
            
            
        }
        
    
    }
    
    
    override func layoutSubviews() {
        overlayIconView!.layer.cornerRadius = 7
    }

}


