//
//  Utilities.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import Foundation
import UIKit
class Utilities {
    
    
    static let color :UIColor = UIColor(red: 112.0/255.0, green: 86.0/255.0, blue: 164.0/255.0, alpha: 1.0)
    
    static let cgColor : CGColor = CGColor(srgbRed: 112.0/255.0, green: 86.0/255.0, blue: 164.0/255.0, alpha: 1.0)
    
    
//    static let color :UIColor = UIColor(red: 70, green: 130, blue: 180, alpha: 1.0)
//
//    static let cgColor : CGColor = CGColor(srgbRed: 170, green: 130, blue: 180, alpha: 1.0)
//
    static func roundFillButton(button : UIButton,color : UIColor){
        
        button.backgroundColor = color
        button.clipsToBounds = true
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
    }
    
    static func roundButton(button : UIButton){
        
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 5.0
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.borderColor = cgColor
        button.tintColor = color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        
        
        
    }
    
    static func lineTextField(textField: UITextField){
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height-3, width: textField.frame.width, height: 3)
        bottomLine.backgroundColor = cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        
    }
    
    
    
    
    
    
}
