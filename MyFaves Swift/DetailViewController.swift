//
//  DetailViewController.swift
//  MyFaves2
//
//  Created by Charles Konkol on 9/12/16.
//  Copyright © 2016 Charles Konkol. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var WebSite: UIWebView!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            // 1) Comment if statement (next 3 lines)
            //            if let label = self.detailDescriptionLabel {
            //                label.text = detail.description
            //            }
            // 2) Add code to load WebView
            if let myWebview = WebSite {
                let url = NSURL(string: detailItem as! String)
                let request = NSURLRequest(URL: url!)
                myWebview.scalesPageToFit = true
                myWebview.loadRequest(request)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

