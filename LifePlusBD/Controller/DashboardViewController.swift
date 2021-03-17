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
    var showsdata = [Shows]()
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSONData()
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
    
    
    func loadJSONData(){
        
        
        let urlStrig = "http://api.tvmaze.com/shows";
        
        guard let url = URL(string: urlStrig) else {return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do{
                if(error == nil){
                    
                    self.showsdata = try JSONDecoder().decode([Shows].self, from: data!)
                    
                    DispatchQueue.main.async {
                        
                        
                        for result in self.showsdata{
                            
                            print("\(String(describing: result.runtime))")
                            
                        }
                    }
                    
                    
                }
            }catch{
                print(error.localizedDescription)
            }
           
            
            
            
            
        }
        task.resume()
        
        
        
        
    }
    
    
    

}
