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
    
    func registerUser(name: String,userName:String,password:String,phone:String)->Bool{
        
        var registerStat : OpaquePointer?
        let registerQuery = "INSERT INTO LifePlusBD(name,userName,password,phone) VALUES(?,?,?,?);"
        
        if sqlite3_prepare_v2(db, registerQuery, -1, &registerStat, nil) == SQLITE_OK{
            
            sqlite3_bind_text(registerStat, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 2, (userName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 3, (password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 4, (phone as NSString).utf8String, -1, nil)
            
            if sqlite3_step(registerStat) == SQLITE_DONE {
                
                print("Successfully Register")
                return true
                
            }else{
                print("Faild to register")
                return false
            }
            
        }else{
            
            return false
        }
        
        
        
        
    }
    
    func userLogin(userName: String,password : String) -> [loginModel]{
        
        var loginStat : OpaquePointer?
        let userN = userName as NSString
        let pass = password as NSString
        
        var loginData = [loginModel]()
        
        let loginQuery = "SELECT * FROM LifePlusBD WHERE userName = '\(userN)' AND password = '\(pass)';"
        
        if sqlite3_prepare(db, loginQuery, -1, &loginStat, nil) == SQLITE_OK {
         
            if sqlite3_step(loginStat) == SQLITE_ROW{
                
                let userNameString = sqlite3_column_text(loginStat, 1)
                let passwordString = sqlite3_column_text(loginStat, 2)
                
                let userName = String(cString: userNameString!)
                let password = String(cString: passwordString!)
                
                loginData.append(loginModel(userName: userName, password: password))
                
            }else{
                print("Faild to login")
            }
            
            
        }else{
        
            print("Fail to prepare in login")
            
        }
        
        
        return loginData
    }
    
    
    func getUserData(userName: String) ->[User]{
        
        var userData = [User]()
        var getUserStat : OpaquePointer?
    
        let user = userName as NSString
        let getUserQuery = "SELECT * FROM LifePlusBD WHERE userName = '\(user)';"
        
        if sqlite3_prepare(db, getUserQuery, -1, &getUserStat, nil) == SQLITE_OK{
            
            
            
            if sqlite3_step(getUserStat) == SQLITE_ROW{
                
                 let nameString = sqlite3_column_text(getUserStat, 0)
                 let userNameString = sqlite3_column_text(getUserStat,1 )
                 let phoneString = sqlite3_column_text(getUserStat, 3)
                let passwordString = sqlite3_column_text(getUserStat, 2)
                
                let name = String(cString: nameString!)
                let userName = String(cString: userNameString!)
                let phone = String(cString: phoneString!)
                let password = String(cString: passwordString!)
                
                
                userData.append(User(name: name, userName: userName, password: password, phone: phone))
            
            }else{
                print("Failed to get data")
            
                
            }
        }else{
           print("Faild to prepare")
            
            
        }
        return userData
        
        
        
        
        
    }
    
    
    
    
}
