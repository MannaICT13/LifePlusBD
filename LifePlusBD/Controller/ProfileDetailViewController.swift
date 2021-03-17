//
//  ProfileDetailViewController.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    
    //MARK:- Properties
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    
    @IBOutlet weak var gobackBtnOutlet: UIButton!
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.roundFillButton(button: gobackBtnOutlet, color: Utilities.color)

      
    }
    
    
    //MARK:- Handlers
    
    @IBAction func goBackAction(_ sender: Any) {
    }
    
}
