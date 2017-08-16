//
//  ItemsCell.swift
//  pw
//
//  Created by Abed Naseri Douraki on 06.07.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

//
// This file is for showing Main items in MainVC
//
//
//


import UIKit

class ItemsCell: UITableViewCell {

    @IBOutlet weak var artikel_image: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var typ_kategorie_label: UILabel!
    @IBOutlet weak var artikel_nummer_label: UILabel!
    @IBOutlet weak var start_datum_label: UILabel!
    @IBOutlet weak var end_datum_label: UILabel!
    @IBOutlet weak var status_label: UILabel!
    

    func configureProductItemsCell(item: ItemsClass){
        artikel_image.downloadedFrom(link: item.artikel_image_url)
        titelLabel.text = item.title
        typ_kategorie_label.text = item.typ_kategorie
        artikel_nummer_label.text = item.artikel_nummer
        start_datum_label.text = item.start_datum
        end_datum_label.text = item.end_datum
        status_label.text = item.status
        
        // Set color for Status label
        if item.status == "Online"{
            status_label.backgroundColor = GREEN_STATUS
        } else{
            status_label.backgroundColor = RED_STATUS
        }
    }

}
