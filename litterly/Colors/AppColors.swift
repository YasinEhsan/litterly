//
//  File.swift
//  litterly
//
//  Created by Joy Paul on 4/9/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

//We use this class to store the values of the colors from the design doc as UIColor values
//it's an extension of UIColor itself
import UIKit

extension UIColor{
    
    static let mainBlue = UIColor(hex: 0x4E5DF8)
    static let trashOrange = UIColor(hex: 0xFFB900)
    static let unselectedGrey = UIColor(hex: 0x353A50)
    static let mainGreen = UIColor(hex: 0x2ECC71)
    static let pageControlUnselectedPageGreen = UIColor(hex: 0x2ECC71, a: 0.32)
    static let textWhite = UIColor(hex: 0xFFFFFF)
    static let searchBoxTextWhite = UIColor(hex: 0x78849E)
    static let searchBoxShadowColor = UIColor(hex: 0x455B63)
    
    //init method for RGB type UIColor
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0){
        self.init(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: a
        )
    }
    
    //init method for UIColor as hex. The ">>" are bitshift operators
    convenience init(hex: Int, a: CGFloat = 1.0){
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
}
