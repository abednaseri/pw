//
//  itemsInfoClass.swift
//  pw
//
//  Created by Abed Naseri Douraki on 07.07.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

//
// This file is for structuring each Artikel's data as a class
//
//
//


import Foundation

class ItemsClass{
    var _id: Int!
    var _artikel_image_url: String!
    var _title: String!
    var _typ_kategorie: String!
    var _artikel_nummer: String!
    var _start_datum: String!
    var _end_datum: String!
    var _status: String!
    
    
    var id: Int{
        if _id == nil{
            _id = -1
        }
        return _id
    }
    
    var artikel_image_url: String{
        if _artikel_image_url == nil{
            _artikel_image_url = ""
        }
        return _artikel_image_url
    }
    
    var title: String{
        if _title == nil{
            _title = ""
        }
        return _title
    }
    
    var typ_kategorie: String{
        if _typ_kategorie == nil{
            _typ_kategorie = ""
        }
        return _typ_kategorie
    }
    
    var artikel_nummer: String{
        if _artikel_nummer == nil{
            _artikel_nummer = ""
        }
        return _artikel_nummer
    }
    
    var start_datum: String{
        if _start_datum == nil{
            _start_datum = ""
        }
        return _start_datum
    }
    
    var end_datum: String{
        if _end_datum == nil{
            _end_datum = ""
        }
        return _end_datum
    }
    
    var status: String{
        if _status == nil{
            _status = ""
        }
        return _status
    }
    
    
    init(id: Int, title: String, artikel_nummer: String, typ_kategorie: String, artikel_image_url: String, status: String, start_datum: String, end_datum: String) {
        self._id = id
        self._title = title
        self._artikel_nummer = artikel_nummer
        self._typ_kategorie = typ_kategorie
        self._artikel_image_url = artikel_image_url
        self._status = status
        self._start_datum = start_datum
        self._end_datum = end_datum
    }

    
}
