//
//  MapsViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/5/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {
    
    //the view state of the card that we will be reffering to
    enum CardState{
        case expanded
        case collapsed
    }
    
    //init some vars
    var cardViewController:CardViewController!
    var visualEffectView:UIVisualEffectView!
    
    //define some costants
    let cardHeight:CGFloat = 345
    let cardHandleAreaHeight:CGFloat = 86
    
    //card is not visible by default
    var cardVisible = false
    
    //next state will return collapsed or expanded based on cardVisibility value
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    //runningAnimations is an array of UIViewPropertyAnimator that we will use to animate our views
    var runningAnimations = [UIViewPropertyAnimator]()
    
    //when animation is interrupted, set the value to 0
    var animatorProgressWhenInterrupted:CGFloat = 0
    
    var mapView: GMSMapView?
    
    lazy var customSearchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMapView()
        addSlideInCardToMapView()
    }
    
    //when view has appeared successfully, we call in to add the sliding card
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeTheNavBarClear()
        addASearchBar()
    }
    
    
}
