//
//  Shows.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import Foundation


struct Shows : Decodable {
    var id : Int?
    var name : String?
    var type : String?
    var language : String?
    var status : String?
    var runtime :Int?
    
    
    
    init(id: Int,name : String,type:String,language : String,status : String,runtime :Int) {
        self.id = id
        self.name = name
        self.type  = type
        self.language = language
        self.status = status
        self.runtime = runtime
    }
    

}
