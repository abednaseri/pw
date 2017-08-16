//
//  Section.swift
//  pw
//
//  Created by Abed Naseri Douraki on 08.08.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

import Foundation

struct Section {
    var genre: String!
    var expanded: Bool!
    
    init(genre: String, expanded: Bool){
        self.genre = genre
        self.expanded = expanded
    }
}
