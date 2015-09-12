//
//  ServerManager.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation

class ServerManager : ServerManagerDelegate{
    let serverAddr = "http://52.24.125.211/api/index.php/pois"
    //let queryString = "username=simonmeier&first_name=simon&last_name=meier&email_address=simon.a.meier@outlook.com"
    var dataManager : DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func getUserToken(username: String, first_name: String, last_name: String, email_address: String) {
        var request = NSMutableURLRequest(URL: NSURL(string: serverAddr)!)
        request.HTTPMethod = "Post"
        var connectionResult : ConnectionResult
        request.setValue("application/json", forHTTPHeaderField: "accept")
        //request.HTTPBody = queryString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) as NSData!
        connectionResult = ConnectionResult(objectType: ObjectType.UserAuthentication, delegate: self)
        var connection = NSURLConnection(request: request, delegate: connectionResult)
    }
    
    func getPois() {
        var request = NSMutableURLRequest(URL: NSURL(string: serverAddr)!)
        request.HTTPMethod = "GET"
        var connectionResult : ConnectionResult
        request.setValue("application/json", forHTTPHeaderField: "accept")
        connectionResult = ConnectionResult(objectType: ObjectType.Pois, delegate: self)
        var connection = NSURLConnection(request: request, delegate: connectionResult)
    }
    func poisReceived(array: NSArray) {
        //dataManager
    }
    
    func serverDataLoaded(objectType: ObjectType, dictionary: NSDictionary) {
        
    }
    func authenticationReceived(array: NSArray) {
        println("Yes")
    }
    func errorHappenedAtAuthentication() {
        
    }
    func errorHappened() {
        
    }
}