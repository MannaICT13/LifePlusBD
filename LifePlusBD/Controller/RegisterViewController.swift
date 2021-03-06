//
//  RegisterViewController.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import UIKit

class RegisterViewController: UIViewController {

    
    //MARK:- Properties
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var useeNameImg: UIImageView!
    @IBOutlet weak var phoneImg: UIImageView!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var registerBtnOutlet: UIButton!
    @IBOutlet weak var passwordImg: UIImageView!
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        utilitieManager()
        setUpImageIcon()

       
    }
    
    
    //MARK:- Handlers
    @IBAction func registerBtnAction(_ sender: Any) {
        
        guard let name = nameTextField.text else {return}
        guard let username = userNameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard let phone = phoneTextField.text else {return}
        
        if TextFieldValidation.nameValidation(name) == false{
            alertMessage(title: "Error Message", msg: "Enter valid Name")
        }else if TextFieldValidation.phoneNumberValidation(phone) == false{
            alertMessage(title: "Error Message", msg: "Enter Valid Phone Number")
            
        }
        else if username == ""{
            alertMessage(title: "Error Message", msg: "Enter Valid User Name")
            
        }
        else if password == "" || password.count<6{
            alertMessage(title: "Error Message", msg: "Enter password more then 5 digit")
            
        }else if SqlHandler.sqlInstance.registerUser(name: name, userName: username, password: password, phone: phone) == true{
            alertMessageAction(title: "Message", msg: "Successfully Registered!")
            
        }else{
            alertMessage(title: "Error Message", msg: "Already Registered")
        }
        
        
     
        
        
    }
    
   

}







extension RegisterViewController{
    
    
    private func utilitieManager(){
         
     Utilities.lineTextField(textField: nameTextField)
     Utilities.lineTextField(textField: userNameTextField)
     Utilities.lineTextField(textField: passwordTextField)
     Utilities.lineTextField(textField: phoneTextField)
     Utilities.roundFillButton(button: registerBtnOutlet, color: Utilities.color)
    
         
         
     }
    
    
    private func setUpImageIcon(){
        
        iconImg.image = UIImage(named: "logo.jpeg")
        nameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
        useeNameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        passwordImg.image = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        phoneImg.image = UIImage(systemName: "phone.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
    }
    
  
    
    
    
    
}

extension RegisterViewController{
    
    
    func alertMessage(title:String,msg:String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    func alertMessageAction(title:String,msg:String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
}
