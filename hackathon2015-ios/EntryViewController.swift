//
//  EntryViewController.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 13/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation
import UIKit

class EntryViewController : UIViewController {
    var currPoi : Poi?
    
    @IBOutlet weak var descrTextField: UITextField!
    @IBOutlet weak var entryTitelLabel: UILabel!
    
    override func viewDidLoad() {
        entryTitelLabel.text = currPoi!.name
        descrTextField.text = currPoi!.description
    }
}