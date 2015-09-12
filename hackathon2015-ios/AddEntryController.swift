//
//  AddEntryController.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 13/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation
import UIKit

class AddEntryController : UIViewController {
    var longitude : Double = 0
    var latitude : Double = 0
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var longLatLabel: UILabel!
    
    override func viewDidLoad() {
        longLatLabel.text = "LG:  \(longitude) , BG:  \(latitude)"
    }
    @IBAction func pinClicked(sender: AnyObject) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).dataManager!.postData(nameTextField.text, description: descriptionTextField.text, longitude: longitude, latitude: latitude, imageBase64: "")
    }
}
