//
//  ConnectionResult.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation

class ConnectionResult: NSObject, NSURLConnectionDelegate {
    var responseData: NSMutableData = NSMutableData()
    var serverManagerDelegate: ServerManagerDelegate
    var objectType: ObjectType
    var token: String?
    var topics: String?
    
    init(objectType: ObjectType, delegate: ServerManagerDelegate) {
        serverManagerDelegate = delegate
        self.objectType = objectType
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        responseData.appendData(data)
    }
    
    func connection(connection: NSURLConnection, willCacheResponse cachedResponse: NSCachedURLResponse) {
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        if objectType == ObjectType.UserAuthentication{
            serverManagerDelegate.errorHappenedAtAuthentication()
        }
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        var error: NSError?
        //var resultJson: Array<Poi> = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableLeaves, error:&myError) as! Array<Poi>
        //var resultJson: NSArray = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableLeaves, error:&myError) as! Array<Poi>
        //todo !!!
        var responseDataString = NSString(data: responseData, encoding:NSUTF8StringEncoding)
        println(responseDataString)
        if objectType == ObjectType.UserAuthentication{
            //serverManagerDelegate.authenticationReceived(list)
        } else if objectType == ObjectType.Pois {
            let anyObj: AnyObject? = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions(0),error: &error)
            var list : Array<Poi> = self.parseJson(anyObj!)
            serverManagerDelegate.poisReceived(list)
        } else if objectType == ObjectType.PoiPush {
            println("pushed")
        }
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
