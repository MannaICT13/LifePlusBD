//
//  SqlHandler.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import Foundation
import SQLite3

class SqlHandler {
    
    
    //MARK:- Properties
    static let sqlInstance = SqlHandler()
    
    var db : OpaquePointer?
    
    
    //MARK:- Handlers
    
    
    func openConnection(){
        
        let fileUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("LifePlusBD.sqlite")
       
        guard let url = fileUrl else {
            return
        }
        
        if sqlite3_open(url.path, &db) == SQLITE_OK{
            print("file url : \(String(describing: url.path))")
        }else{
            return
        }
        
        
        
    }
    
    func createTable(){

        var tableCreateStat : OpaquePointer?
        let tableCreateQuery = "CREATE TABLE IF NOT EXISTS LifePlusBD(name VARCHAR(100),userName VARCHAR(100) PRIMARY KEY NOT NULL,password VARCHAR(100) NOT NULL,phone VARCHAR(20));"
        
        if sqlite3_prepare_v2(db, tableCreateQuery, -1, &tableCreateStat, nil) == SQLITE_OK{
            guard sqlite3_step(tableCreateStat) == SQLITE_DONE else {
                return
            }
            
            
        }else{
            return
        }

        sqlite3_finalize(tableCreateStat)

    }
    
    func registerUser(name: String,userName:String,password:String,phone:String){
        
        var registerStat : OpaquePointer?
        let registerQuery = "INSERT INTO LifePlusBD(name,userName,password,phone) VALUES(?,?,?,?);"
        
        if sqlite3_prepare_v2(db, registerQuery, -1, &registerStat, nil) == SQLITE_OK{
            
            sqlite3_bind_text(registerStat, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 2, (userName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 3, (password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 4, (phone as NSString).utf8String, -1, nil)
            
            if sqlite3_step(registerStat) == SQLITE_DONE {
            
                print("Successfully Register")
            }else{
                print("Faild to register")
                return
            }
            

            
        }else{
            
            return
        }
        
        
        
        
    }
    
    
    
    
    
    
}