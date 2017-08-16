//
//  UIApplication.swift
//  pw
//
//  Created by Abed Naseri Douraki on 04.07.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

//
// This file is for Sliding Menu
//
// This file is used by ExSlideMenuController.swift
//


import SlideMenuControllerSwift

extension UIApplication {
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        if let slide = viewController as? SlideMenuController {
            return topViewController(slide.mainViewController)
        }
        return viewController
    }
}

