//
//  ContainerVC.swift
//  pw
//
//  Created by Abed Naseri Douraki on 06.07.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

//
// This file is for Sliding Menu
//
// 
//


import SlideMenuControllerSwift

class ContainerVC: SlideMenuController {
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Main"){
            self.mainViewController = controller
        }
        super.awakeFromNib()
    }
    
    
}

