//
//  DataManager.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation
import UIKit

/*
var jsonArray =  "[{ \"id\" : 1, \"name\":\"Grauspitz\",\"name\":\"Grauspitz\",\"description\":\"Der höchste Berg in Liechtenstein\",\"longitude\":9.581263,\"latitude\":47.052934}]"
*/

class DataManager : DataManagerDelegate{
    var appDelegate2 : AppDelegate2
    
    init(delegate: AppDelegate2) {
        appDelegate2 = delegate
    }
    func getData() {
        let serverManager : ServerManager? = ServerManager(dataManagerDelegate: self)
        serverManager!.getUserToken("simonmeier", first_name: "Simon", last_name: "Meier", email_address: "simon.a.meier@gmail.com")
        serverManager!.getPois()
    }
    
    func dataReceived(array: Array<Poi>) {
        appDelegate2.dataReceived(array)
    }
    
    func postData(name: String, description: String, longitude: Double, latitude: Double, imageBase64: String) {
        let serverManager : ServerManager? = ServerManager(dataManagerDelegate: self)
        serverManager!.postData(name, description: description, longitude: longitude, latitude: latitude, imageBase64: imageBase64)
    }

}