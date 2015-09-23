//
//  AddEntryController.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 13/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation
import UIKit

class AddEntryController : UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate {
    var longitude : Double = 0
    var latitude : Double = 0
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var positionLabel: UILabel!
    
    override func viewDidLoad() {
        positionLabel.text = "LG:  \(longitude) , BG:  \(latitude)"
        nameTextField.tag=0
        nameTextField.delegate = self
        descriptionTextField.tag=1
        descriptionTextField.delegate = self
    }
    @IBAction func pinClicked(sender: AnyObject) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).dataManager!.postData(nameTextField.text!, description: descriptionTextField.text!, longitude: longitude, latitude: latitude, imageBase64: "")
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.tag == 0 {
            nameTextField.text=""
        }else if textField.tag == 1 {
            descriptionTextField.text = ""
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.tag == 0 {
            nameTextField.resignFirstResponder()
        }else if textField.tag == 1 {
            descriptionTextField.resignFirstResponder()
        }
        return true
    }
    
    /*
    func takePhoto(sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    */
    
}
