//
//  Poi.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation

class Poi {
    var id: Int?
    var name: String?
    var description: String?
    var longitute: Float?
    var latitute: Float?
    
    init() {
        
    }
    
    init(id: Int,name: String, desc: String, long: Float, lat: Float) {
        self.id = id
        self.name = name
        description = desc
        longitute = long
        latitute = lat
    }
}
