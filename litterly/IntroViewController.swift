//
//  IntroViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/5/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit
import OnboardKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        onBoardInstances()
    }
    
    //this func stores all of our onboarding data
    func onBoardInstances() {
        
        let pageOne = OnboardPage(title: "Hi there! Welcome to Litterly",
                                  imageName: "trash",
                                  description: "a journey to save the city from trash")
        let pageTwo = OnboardPage(title: "Save the City",
                                  imageName: "building",
                                  description: "Meeting others in your city and collect #trashtags to help our environment")
        let pageThree = OnboardPage(title: "Be a hero!",
                                  imageName: "statue",
                                  description: "Earn points and redeem for prizes")
       
        //create a onboardingViewController programatically and pass the pages as an array
        let onboardingViewController = OnboardViewController(pageItems: [pageOne, pageTwo, pageThree])
        
        //present the view controller
        onboardingViewController.presentFrom(self, animated: true)
    }

}
