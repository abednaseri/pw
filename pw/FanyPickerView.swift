//
//  FanyPickerView.swift
//  pw
//
//  Created by Abed Naseri Douraki on 16.08.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

import UIKit

class FanyPickerView: UIPickerView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setValue(UIColor.white, forKey: "textColor")
    }
    
//    var changed = false
    override func addSubview(_ view: UIView) {
//        if !changed {
//            changed = true
            self.setValue(UIColor.white, forKey: "textColor")
//        }
        super.addSubview(view)
    }

}
