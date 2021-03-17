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
