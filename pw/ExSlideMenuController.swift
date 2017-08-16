//
//  ExSlideMenuController.swift
//  pw
//
//  Created by Abed Naseri Douraki on 04.07.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

//
// This file is for Sliding Menu
//
// This file uses UIApplication.swift class
//


import SlideMenuControllerSwift

class ExSlideMenuController: SlideMenuController{
    
    override func isTagetViewController() -> Bool {
        if let vc = UIApplication.topViewController(){
            if vc is MainVC || vc is CreateVC {
                return true
            }
        }
        return false
    }

}


