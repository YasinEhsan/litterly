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
    
    static let slideInCardBlue = UIColor(hex: 0x4E5DF8)
    static let selectedTrashTypeOrange = UIColor(hex: 0xFFB900)
    static let unSelectedTrashTypeGrey = UIColor(hex: 0x353A50)
    static let reportTrashGreen = UIColor(hex: 0x2ECC71)
    static let slideInCardTextWhite = UIColor(hex: 0xFFFFFF)
    
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

