//
//  SearchBarViewController-MapsVC.swift
//  litterly
//
//  Created by Joy Paul on 4/10/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

extension MapsViewController{
    
    func makeTheNavBarClear(){
        view.bringSubviewToFront(mapView!)
        
        let appBar = navigationController?.navigationBar
        
        appBar?.setBackgroundImage(UIImage(), for: .default)
        appBar?.shadowImage = UIImage()
        appBar?.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func addASearchBar(){
        
        let searchView = UIView(frame: CGRect(x: 16, y: 5, width: self.view.frame.width - 31, height: 52))
        searchView.backgroundColor = UIColor.slideInCardTextWhite
        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        //add a gesture recognizer in order to bring the navigation drawer from the left
        let imageName = "menu"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 16, y: 14, width: 24, height: 24)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        searchView.addSubview(imageView)
        
        let searchBox = UITextField()
        searchBox.frame = CGRect(x: 73, y: 16, width: self.view.frame.width - 104, height: 24)
        searchBox.backgroundColor = UIColor.slideInCardTextWhite
        searchBox.textColor = UIColor.searchBoxTextColor
        searchBox.font = UIFont(name: "MarkerFelt-Wide", size: 16)
        searchBox.text = "Search a place?"
        searchBox.translatesAutoresizingMaskIntoConstraints = false
        searchView.addSubview(searchBox)
        
        searchView.layer.cornerRadius = 12
        let shadowColor = UIColor.searchBoxShadowColor.cgColor
        searchView.layer.shadowColor = shadowColor
        searchView.layer.shadowRadius = 12
        
        self.navigationController?.navigationBar.addSubview(searchView)
        
    }
}
