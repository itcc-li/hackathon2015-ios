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
    var dataList : Array<Poi> = Array<Poi>()
    var selectedPoi : Poi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        showData()
        //dataList = dataManager.getData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showData() {
        dataList = (UIApplication.sharedApplication().delegate as! AppDelegate).poisData
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
        if indexPath.row == dataList.count {
            let cell : UITableViewCell = UITableViewCell()
            let textView : UITextView = UITextView()
            cell.textLabel!.text = "+"
            cell.textLabel?.textAlignment = .Center
            cell.contentView.addSubview(textView)
            return cell
        } else {
            var cell : UITableViewCell?
            cell = tableView.dequeueReusableCellWithIdentifier("poiCell")
            if cell == nil {
                cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"poiCell")
            }
            //var image : UIImage = UIImage(named: "grauspitz")!
            //cell!.imageView!.image = image
            let textView : UITextView = UITextView()
            cell!.textLabel!.text = dataList[indexPath.row].name
            cell!.contentView.addSubview(textView)
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row < dataList.count {
            selectedPoi = dataList[indexPath.row]
            performSegueWithIdentifier("showDetail", sender: self)
        } else {
            performSegueWithIdentifier("addDetail", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "showDetail" {
            let entryViewController = segue.destinationViewController as! EntryViewController
            entryViewController.currPoi = selectedPoi
        }
    }
    
    @IBAction func cancelToListViewController(segue:UIStoryboardSegue) {
        
    }
}

