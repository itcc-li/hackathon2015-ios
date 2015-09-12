//
//  ServerManagerDelegate.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation

protocol ServerManagerDelegate {
    func serverDataLoaded(objectType: ObjectType, dictionary: NSDictionary)
    func authenticationReceived()
    func errorHappenedAtAuthentication()
    func errorHappened()
}