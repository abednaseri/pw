//
//  UIViewController.swift
//  pw
//
//  Created by Abed Naseri Douraki on 04.07.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

//
// This file is for Sliding Menu
//
// This file adds Menu Icon and Company logo to Navigation Bar
//


import UIKit

extension UIViewController{
    
    func setNavigationBarItem(){
        self.addLeftBarButtonWithImage(MENU_ICON!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
        
        let imageView = UIImageView(image: LOGO)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = NAVIGATION_LOGO_SIZE
        navigationItem.titleView = imageView
        
    }
    
    func removeNavigationBarItem(){
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.removeLeftGestures()
    }
    
}

