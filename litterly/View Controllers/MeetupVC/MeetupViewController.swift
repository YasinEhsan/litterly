//
//  MeetupViewController.swift
//  litterly
//
//  Created by Joy Paul on 4/18/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit
import Cards

class MeetupViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCards()
        configureUI()
    }
    
    func setUpCards(){
        
        let card = CardHighlight(frame: CGRect(x: 10, y: 30, width: 200 , height: 240))
        
        card.backgroundColor = UIColor(red: 0, green: 94/255, blue: 112/255, alpha: 1)
        card.icon = UIImage(named: "flappy")
        card.title = "Welcome \nto \nCards !"
        card.itemTitle = "Flappy Bird"
        card.itemSubtitle = "Flap That !"
        card.textColor = UIColor.white
        
        card.hasParallax = true
        
        
        
        view.addSubview(card)
    }
    
    func configureUI(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        
        // create the button
        let suggestImage  = UIImage(named: "menu")!.withRenderingMode(.alwaysOriginal)
        let suggestButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        suggestButton.setBackgroundImage(suggestImage, for: .normal)
        suggestButton.addTarget(self, action: #selector(goBackToMap), for: .touchUpInside)
        
        // here where the magic happens, you can shift it where you like
        suggestButton.transform = CGAffineTransform(translationX: 10, y: 0)
        
        // add the button to a container, otherwise the transform will be ignored
        let suggestButtonContainer = UIView(frame: suggestButton.frame)
        suggestButtonContainer.addSubview(suggestButton)
        let suggestButtonItem = UIBarButtonItem(customView: suggestButtonContainer)
        
        // add button shift to the side
        navigationItem.leftBarButtonItem = suggestButtonItem
    }
    
    @objc func goBackToMap(){
        self.dismiss(animated: true, completion: nil)
    }

}
