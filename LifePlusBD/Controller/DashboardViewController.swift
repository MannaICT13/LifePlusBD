//
//  DashboardViewController.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import UIKit

class DashboardViewController: UIViewController {

    

    //MARK:- Properties
    
    var userName : String = ""
    
    var profileData = [User]()
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(showProfile))
        
        profileData = SqlHandler.sqlInstance.getUserData(userName: userName)
    }
    
    
    //MARK:- Handlers
    
    @objc func showProfile(){
        
        let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileDetailViewController") as! ProfileDetailViewController
        profileVC.strName = "Name: \(String(describing: profileData[0].name!))"
        profileVC.strUserName = "User Name: \(String(describing: profileData[0].userName!))"
        profileVC.strPhone = "Phone: \(String(describing: profileData[0].phone!))"
        self.navigationController?.pushViewController(profileVC, animated: true)
        
        
        
    }
    
    
    

}
