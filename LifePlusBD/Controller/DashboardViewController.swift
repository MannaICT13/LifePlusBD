//
//  DashboardViewController.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import UIKit

class DashboardViewController: UIViewController {

    
    
    //MARK:- Properties
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(showProfile))
        
        
    }
    
    
    //MARK:- Handlers
    
    @objc func showProfile(){
        
        let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileDetailViewController") as! ProfileDetailViewController
        self.navigationController?.pushViewController(profileVC, animated: true)
        
        
        
    }
    
    
    

}
