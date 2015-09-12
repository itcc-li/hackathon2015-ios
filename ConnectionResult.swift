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
        var myError: NSError? = nil
        var resultJson: AnyObject? = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableLeaves, error:&myError)
        var error = NSString(data: responseData, encoding:NSUTF8StringEncoding)
        if resultJson is NSDictionary {
            if objectType == ObjectType.UserAuthentication{
                serverManagerDelegate.authenticationReceived()
            }
        }else {
            var message = "Server response data not in expected format: "
            var error = NSString(data: responseData, encoding:NSUTF8StringEncoding)
            if error != nil {
                message += error as! String
            }
            println(message)
            serverManagerDelegate.errorHappened()
        }
    }
}
