//
//  LeftVC.swift
//  pw
//
//  Created by Abed Naseri Douraki on 06.07.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

//
// This file is for Sliding Menu
//
// This file is used to show a list of menu items from left side of Application
//


import UIKit


enum LeftMenu: Int{
    case main = 0
    case create
    case nonMenu
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}


class LeftVC: UIViewController, LeftMenuProtocol, UITableViewDelegate, UITableViewDataSource {

    var menus = ["Home", "Neu machen"]
    var MainVC: UIViewController!
    var CreateVC: UIViewController!
    
    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.init(red: 73/255, green: 74/255, blue: 78/255, alpha: 1.0)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        self.MainVC = UINavigationController(rootViewController: mainVC)
        
        let createVC = storyboard.instantiateViewController(withIdentifier: "CreateVC") as! CreateVC
        self.CreateVC = UINavigationController(rootViewController: createVC)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    // This function is for the LeftMenuProtocol
    func changeViewController(_ menu: LeftMenu) {
        switch menu{
        case .main:
            slideMenuController()?.changeMainViewController(self.MainVC, close: true)
        case .create:
            slideMenuController()?.changeMainViewController(self.CreateVC, close: true)
        default:
            print("Default in switch in somewhere in LeftVC")
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let menu = LeftMenu(rawValue: indexPath.row){
            switch menu{
            case .main, .create, .nonMenu:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
                cell.menuItem.text = menus[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
    // This below functions actually switches the ControllerViews
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row){
            self.changeViewController(menu)
        }
    }
    
    
    // Clear cell color
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
}
