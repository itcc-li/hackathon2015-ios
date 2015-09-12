//
//  ViewController.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 10/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
        if indexPath.row == 4
        {
            var cell : UITableViewCell = UITableViewCell()
            var textView : UITextView = UITextView()
            cell.textLabel!.text = "+"
            cell.textLabel?.textAlignment = .Center
            cell.contentView.addSubview(textView)
            return cell
        }
        else
        {
            var cell : UITableViewCell = UITableViewCell()
            var image : UIImage = UIImage(named: "grauspitz")!
            cell.imageView!.image = image
            var textView : UITextView = UITextView()
            cell.textLabel!.text = "Grauspitz"
            cell.contentView.addSubview(textView)
            return cell
        }
    }
}

