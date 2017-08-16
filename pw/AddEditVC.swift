//
//  AddEditVC.swift
//  pw
//
//  Created by Abed Naseri Douraki on 11.08.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

import UIKit
import Alamofire

class AddEditVC: UITableViewController {

    var product_obj: ItemsClass!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    // MARK: - Main Function to save all
    
    @IBAction func mainSaveButtonTapped(_ sender: Any) {
        //mainHTTPRequestToSaveAll()
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            print("section= \(indexPath.section) product= \(product_obj!)")
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AllgemeineProduktdatenCell") as? AllgemeineProduktdatenCell{
                cell.setUpAllgemeineFields(product: product_obj!)
                return cell
            } else{
                print("First section failed")
                return AllgemeineProduktdatenCell()
            }
        case 1:
            print("section= \(indexPath.section)")
            if let cell = tableView.dequeueReusableCell(withIdentifier: SECT_1_IDENTIF) as? EinzelmoebelSpezifikationenCell{
                //cell.setUpAllgemeineFields(product: product_obj)
                return cell
            }else{
                print("Second section failed")
                return EinzelmoebelSpezifikationenCell()
            }
        case 2:
            print("section= \(indexPath.section)")
            if let cell = tableView.dequeueReusableCell(withIdentifier: SECT_2_IDENTIF) as? GrundrissAbmessungenCell{
                //cell.setUpAllgemeineFields(product: product_obj)
                return cell
            }else{
                print("Third section failed")
                return GrundrissAbmessungenCell()
            }
        case 3:
            print("section= \(indexPath.section)")
            if let cell = tableView.dequeueReusableCell(withIdentifier: SECT_3_IDENTIF) as? SaveButtonCell{
                //cell.setUpAllgemeineFields(product: product_obj)
                return cell
            } else{
                print("Last section failed")
                return SaveButtonCell()
            }
        default:
            print("section=  Default")
            return UITableViewCell()
        }
    }

    
    
    
}
