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
    
    //MARK:- init
    override func viewDidLoad() {
        super.viewDidLoad()
    utilitieManager()
    setUpImageIcon()

       
    }
    
    //MARK:- Handlers
    
    @IBAction func loginBtnAction(_ sender: Any) {
    }
    
    @IBAction func registrationBtnAction(_ sender: Any) {
    }
    
    
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
