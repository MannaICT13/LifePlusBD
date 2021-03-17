//
//  DashboardViewController.swift
//  LifePlusBD
//
//  Created by Md Khaled Hasan Manna on 17/3/21.
//

import UIKit

class DashboardViewController: UIViewController {

    

    //MARK:- Properties
    
    @IBOutlet weak var showsTableView: UITableView!
    var userName : String = ""
    
    var profileData = [User]()
    var showsdata = [Shows]()
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSONData()
        createSearchBar()
        addLogoutBtn()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(showProfile))
        
        profileData = SqlHandler.sqlInstance.getUserData(userName: userName)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
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
                        self.showsTableView.reloadData()
//
//                        for result in self.showsdata{
//
//                            print("\(String(describing: result.runtime))")
//
//                        }
                        
                    }
                    
                    
                }
            }catch{
                print(error.localizedDescription)
            }
           
            
            
            
            
        }
        task.resume()
        
        
        
        
    }
    
    func addLogoutBtn(){
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        
    }
    @objc func logout(){
        
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    

}

extension DashboardViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        showsdata.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell :DashboardTableViewCell = showsTableView.dequeueReusableCell(withIdentifier: "cell") as! DashboardTableViewCell
        cell.nameLbl.text = showsdata[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let detailVC : DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailVC.id = showsdata[indexPath.row].id
        detailVC.name = showsdata[indexPath.row].name
        detailVC.type = showsdata[indexPath.row].type
        detailVC.langu = showsdata[indexPath.row].language
        detailVC.status = showsdata[indexPath.row].status
        detailVC.runtime = showsdata[indexPath.row].runtime
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    

    
    
}

extension DashboardViewController  : UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating {
  
    
    private func createSearchBar(){
        
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        
        guard let searchText = searchController.searchBar.text else{return}
        
        if(searchText == ""){
           loadJSONData()
        }else{
            
            showsdata = showsdata.filter{
                ($0.name?.localizedCaseInsensitiveContains(searchText))!
                
            }
           
            
        }
        self.showsTableView.reloadData()
        
    }
    
    
    
    
    
    
    
    
}
