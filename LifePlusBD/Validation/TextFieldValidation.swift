//
//  TextFieldValidation.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import Foundation
class TextFieldValidation{
    
    static func nameValidation(_ name:String)->Bool{
        
        let nameRegEx = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
        let trimName = name.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        let isValidateName = validateName.evaluate(with: trimName)
        
        return isValidateName
    
    }
    
    static func phoneNumberValidation(_ phone :String)->Bool{
        
        let phoneRegEx = "^[0]\\d{10}$" //11 digits bangladeshi phone number
        let phoneTrim = phone.trimmingCharacters(in: .whitespaces)
        let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        let isValidatePhone = validatePhone.evaluate(with: phoneTrim)
        return isValidatePhone
        
    }
    
    
    
}
