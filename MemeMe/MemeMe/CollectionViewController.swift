//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Matei Suica on 06/03/16.
//  Copyright © 2016 QuadroQ. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    
    override func viewDidLoad() {
        collection.dataSource = self
        collection.delegate = self
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memeCollectionCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.thumbNailMeme.image = memes[indexPath.row].memedImage
        return cell
    }
    
}