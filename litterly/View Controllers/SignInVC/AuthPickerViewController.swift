//
//  AuthPickerViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/15/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit
import Lottie

class AuthPickerViewController: UIViewController {
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setUpAnimation(){
        let animation = Animation.named("plant")
        
        animationView.animation = animation
        animationView.frame = .zero
        animationView.contentMode = .center
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        animationView.play()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpAnimation()
    }
}
