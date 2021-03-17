//
//  Utilities.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import Foundation
import UIKit
class Utilities {
    
    //MARK:- Properties
    
    static let color :UIColor = UIColor(red: 28/255, green: 135/255, blue: 183/255, alpha: 1.0)

    static let cgColor : CGColor = CGColor(srgbRed: 28/255, green: 135/255, blue: 183/255, alpha: 1.0)

    
    
    //MARK:- Handlers
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
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height-3, width: textField.frame.width-20, height: 3)
        bottomLine.backgroundColor = cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        
    }
    
    
    
    
    
    
}
