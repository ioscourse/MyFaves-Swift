//
//  MasterViewController.swift
//  MyFaves
//
//  Created by Charles Konkol on 1/27/15.
//  Copyright (c) 2015 Rock Valley College. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    // 1) comment out var objects line
    //    var objects = NSMutableArray()
    
    // 2) declare and initialize two arrays
    
    var ListOfFavs:[String]?
    var FavDetails:[String]?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clearsSelectionOnViewWillAppear = false
        self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        // 3) Comment out next 2 lines
        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
        
        // 4) Add items to 2 arrays
        //Menus
        
        ListOfFavs = ["Mall","Biking", "Google"]
        FavDetails = ["http://www.shopcherryvalemall.com/","http://www.bicycling.com", "http://www.google.com"]
        
        let controllers = self.splitViewController!.viewControllers
        self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 5) Comment out func insertNewObject. Select from line finc InsertNewObject to } and use shortcut [Command] + / to comment all lines
    
    //    func insertNewObject(sender: AnyObject) {
    //        objects.insertObject(NSDate(), atIndex: 0)
    //        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    //        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    //    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                // 6) replace = objects[indexPath.row] as NSDate
                //    with    = FavDetails![indexPath.row]
                let object = FavDetails![indexPath.row]
                let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 7) Replace objects.count with ListOfFavs!.count
        return ListOfFavs!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        // 8) comment out next line
        //let object = objects[indexPath.row] as NSDate
        
        // 9) replace object.description  with ListOfFavs![indexPath.row]
        cell.textLabel.text = ListOfFavs![indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // 10) Comment out override func tableView(tableView
    
    //    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //        if editingStyle == .Delete {
    //            objects.removeObjectAtIndex(indexPath.row)
    //            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    //        } else if editingStyle == .Insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    //        }
    //    }
    
    
}

