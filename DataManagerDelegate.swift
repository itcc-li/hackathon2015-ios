//
//  DataManagerDelegate.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation

protocol DataManagerDelegate {
    func dataReceived(data: Array<Poi>)
}