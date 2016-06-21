//
//  MyTableVCTableViewController.swift
//  TableViewControllerText
//
//  Created by Matei Suica on 6/20/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import UIKit

class MyTableVCTableViewController: UITableViewController {
    
    var cars = ["BMW", "Ford", "Chevy", "Volvo", "Subaru"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cars.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        cell.textLabel?.text = cars[indexPath.row]
        cell.detailTextLabel?.text = "I love my \(cars[indexPath.row])"

        return cell
    }
}
