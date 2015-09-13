//
//  InterfaceController.swift
//  hackathon2015-ios WatchKit Extension
//
//  Created by Simon Meier on 11/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import WatchKit
import Foundation
import MapKit

class InterfaceController: WKInterfaceController {
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        if segueIdentifier == "showMountain" {
            return ["segue": "showMountain", "data": "Passed through push"]
        } else {
            return ["segue": "", "data": ""]
        }
    }
}
