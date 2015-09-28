//
//  DataManager.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation
import UIKit


class DataManager : DataManagerDelegate{
    var appDelegate2 : AppDelegate2
    
    init(delegate: AppDelegate2) {
        appDelegate2 = delegate
    }
    
    func getData() {
        let service = GTLServicePoiApi()
        /*
        if (service == nil) {
            service.retryEnabled = True;
            GTMHTTPFetcher.setLoggingEnabled(True)
        }
        */
        
        let query = GTLQueryPoiApi.queryForGetPoiOverviewListWithLatitude(47.0,
        longitude:9.0,maxCount: 100)
        service.executeQuery(query, completionHandler:
            { (ticket: GTLServiceTicket!, object: AnyObject!, error: NSError!) in
                if object != nil {
                    let test = object as! GTLPoiApiPoiOverviewListBean
                    print(test)
                }
                //NSArray *items = [object items];
                // Do something with items.
                
            }
        )
    
        /*
        let serverManager : ServerManager? = ServerManager(dataManagerDelegate: self)
        serverManager!.getUserToken("simonmeier", first_name: "Simon", last_name: "Meier", email_address: "simon.a.meier@gmail.com")
        serverManager!.getPois()
        */
    }
    
    
    func dataReceived(array: Array<Poi>) {
        appDelegate2.dataReceived(array)
    }
    
    func postData(name: String, description: String, longitude: Double, latitude: Double, imageBase64: String) {
        let serverManager : ServerManager? = ServerManager(dataManagerDelegate: self)
        serverManager!.postData(name, description: description, longitude: longitude, latitude: latitude, imageBase64: imageBase64)
    }

}