//
//  LoginViewController.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    //MARK:- Properties
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var passwordImg: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtnOutlet: UIButton!
    @IBOutlet weak var registrationBtnOutlet: UIButton!
    
    
    var loginData = [loginModel]()
    var isSuccess = Bool()
    //MARK:- init
    override func viewDidLoad() {
        super.viewDidLoad()
    utilitieManager()
    setUpImageIcon()

       // loginData = SqlHandler.sqlInstance.userLogin(userName: <#T##String#>, password: <#T##String#>)
       
    }
    
    //MARK:- Handlers
    
    @IBAction func loginBtnAction(_ sender: Any) {
        
        guard let userName = userNameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        loginData = SqlHandler.sqlInstance.userLogin(userName: userName, password: password, isFail: &isSuccess)
        
        
        if isSuccess == true{
            for login in loginData{
                
                if(userName == login.userName && password == login.password){
                  
                    let dashVC = self.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                    dashVC.userName = userName
                    
                    self.navigationController?.pushViewController(dashVC, animated: true)
                    break
                }
            }
            
        }else{
            self.alertMessage(title: "Error Message", msg: "Wrong User Name or Password")
        }
     
        userNameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
      
    }
    
    @IBAction func registrationBtnAction(_ sender: Any) {
        
        
        let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    

    
    
}


extension LoginViewController {
    
    
    private func utilitieManager(){
         
     Utilities.lineTextField(textField: userNameTextField)
     Utilities.lineTextField(textField: passwordTextField)
     Utilities.roundFillButton(button: loginBtnOutlet, color: Utilities.color)
     Utilities.roundButton(button: registrationBtnOutlet)
         
         
     }
     
     private func setUpImageIcon(){
         iconImg.image = UIImage(named: "logo.jpeg")
         userImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         passwordImg.image = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         
     }

}


extension LoginViewController{
    
    
    func alertMessage(title:String,msg:String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
}
