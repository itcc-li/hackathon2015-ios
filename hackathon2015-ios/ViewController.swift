//
//  ViewController.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 10/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    @IBAction func buttonClicked(sender: UIButton) {
        text.text = "Gipfel erklummen"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

