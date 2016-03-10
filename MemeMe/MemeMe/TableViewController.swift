//
//  TableViewController.swift
//  MemeMe
//
//  Created by Matei Suica on 06/03/16.
//  Copyright © 2016 QuadroQ. All rights reserved.
//

import Foundation
import UIKit

class TableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        table.dataSource = self
        table.delegate = self
    }
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("memeCell", forIndexPath: indexPath) as! TableViewCell
        
        cell.bottomText.text = memes[indexPath.row].bottomText
        cell.topText.text = memes[indexPath.row].topText
        cell.thumbnailImage.image = memes[indexPath.row].memedImage
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
}