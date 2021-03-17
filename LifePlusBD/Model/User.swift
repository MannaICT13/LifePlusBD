//
//  User.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import Foundation

struct User {
    
    
    var name : String?
    var userName : String?
    var password : String?
    var phone : String?
    
    init(name:String,userName:String,password:String,phone:String) {
        
        self.name = name
        self.userName = userName
        self.password = password
        self.phone = phone
    }
    

    
}
