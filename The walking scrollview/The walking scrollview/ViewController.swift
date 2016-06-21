//
//  ViewController.swift
//  The walking scrollview
//
//  Created by Matei Suica on 6/20/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let WIDTH: CGFloat = 240
    let HEIGHT: CGFloat = 397
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        for var x in 1...5 {
            let img = UIImage(named: "\(x)")
            let imgView = UIImageView(image: img)
            
            scrollView.addSubview(imgView)
            
            imgView.frame = CGRectMake(-WIDTH + (WIDTH * CGFloat(x)), 180, WIDTH, HEIGHT)
        }
        scrollView.contentSize = CGSizeMake(WIDTH * 10, scrollView.frame.size.height)
    }


}

