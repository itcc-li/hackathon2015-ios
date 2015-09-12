//
//  ServerManager.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation

class ServerManager : ServerManagerDelegate{
    let serverAddr = "http://52.24.125.211/api/index.php/users"
    let queryString = "username=simonmeier&first_name=simon&last_name=meier&email_address=simon.a.meier@outlook.com"
    
    func getUserToken(username: String, first_name: String, last_name: String, email_address: String) {
        var request = NSMutableURLRequest(URL: NSURL(string: serverAddr)!)
        request.HTTPMethod = "POST"
        var connectionResult : ConnectionResult
        request.HTTPBody = queryString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) as NSData!
        connectionResult = ConnectionResult(objectType: ObjectType.UserAuthentication, delegate: self)
        var connection = NSURLConnection(request: request, delegate: connectionResult)
    }
    
    func serverDataLoaded(objectType: ObjectType, dictionary: NSDictionary) {
        
    }
    func authenticationReceived() {
        println("Yes")
    }
    func errorHappenedAtAuthentication() {
        
    }
    func errorHappened() {
        
    }
}