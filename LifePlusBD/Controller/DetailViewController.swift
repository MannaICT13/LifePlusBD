//
//  DetailViewController.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import UIKit

class DetailViewController: UIViewController {

    
    //MARK:- Properties
    
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var runtimeLbl: UILabel!
    
  
    var id : Int?
    var name : String?
    var type: String?
    var langu : String?
    var status : String?
    var runtime : Int?
    
    
    
    //MARK:- Init
    override func viewDidLoad() {
        
        
        idLbl.text = "\(String(describing: id!))"
        nameLbl.text = name
        typeLbl.text = type
        language.text = langu
        statusLbl.text = status
        runtimeLbl.text = "\(String(describing: runtime!))"
        
        
        super.viewDidLoad()
   
        

    }
    

  

}
