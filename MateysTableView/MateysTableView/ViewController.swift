//
//  ViewController.swift
//  MateysTableView
//
//  Created by Matei Suica on 6/20/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var uglyThings = ["https://s-media-cache-ak0.pinimg.com/236x/3a/9d/7a/3a9d7aa2d2053bc0153dbbae2bf28290.jpg", "http://www.b3ta.com/images/challenge/makecuteugly_large.jpg", "http://s2.quickmeme.com/img/d1/d13cbd1eb817dab03bb04b92c4e81dd5d8ac1a40ed582a3551bc91156155b4e5.jpg", "https://theembiggensproject.files.wordpress.com/2012/06/bigfoot.jpg?w=523", "https://www.biggerpockets.com/renewsblog/wp-content/uploads/2013/05/Ugly.jpg"]
    
    var uglyTitles = ["Man, this is ugly", "This isn't so bar", "Woooow man", "Ugly sh!t", "Kill me now"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? MyTableViewCell {
            
            var img : UIImage!
            
            
            let url = NSURL(string: uglyThings[indexPath.row])!
            if let data = NSData(contentsOfURL: url) {
                img = UIImage(data: data)
            } else {
                img = UIImage(named: "placehoder")
            }
            
            cell.configureCell(img, text: uglyTitles[indexPath.row])
            
            return cell;
        } else {
            return MyTableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return uglyThings.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

