//
//  DataManager.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation
import UIKit

class DataManager : NSObject{
    func getData() -> Array<Poi> {
        let serverManager = ServerManager(dataManager: self)
        serverManager.getUserToken("simonmeier", first_name: "Simon", last_name: "Meier", email_address: "simon.a.meier@gmail.com")
        var jsonArray =  "[{ \"id\" : 1, \"name\":\"Grauspitz\",\"name\":\"Grauspitz\",\"description\":\"Der höchste Berg in Liechtenstein\",\"longitude\":9.581263,\"latitude\":47.052934}]"
        var data: NSData = jsonArray.dataUsingEncoding(NSUTF8StringEncoding)!
        var error: NSError?
        let anyObj: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0),
            error: &error)
        println(error)
        var list : Array<Poi> = self.parseJson(anyObj!)
        return list
    }
    
    func parseJson(anyObj:AnyObject) -> Array<Poi>{
        var list:Array<Poi> = []
        if  anyObj is Array<AnyObject> {
            var poi:Poi = Poi()
            for json in anyObj as! Array<AnyObject>{
                poi.name = (json["name"] as AnyObject? as? String) ?? "" // to get rid of null
                poi.id  =  (json["id"]  as AnyObject? as? Int) ?? 0
                poi.description = (json["description"] as? String) ?? ""
                poi.longitude = (json["longitude"] as? Float) ?? 0
                poi.latitude = (json["latitude"] as? Float) ?? 0
                list.append(poi)
            }
        }
        return list
    }
}