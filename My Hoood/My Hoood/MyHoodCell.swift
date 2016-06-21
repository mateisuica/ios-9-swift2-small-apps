//
//  MyHoodCell.swift
//  My Hoood
//
//  Created by Matei Suica on 6/20/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//
import UIKit

class MyHoodCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDesc: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImage.layer.cornerRadius = postImage.frame.width / 2
        postImage.clipsToBounds = true
    }
    
    func configCell(post: Post) {
        postDesc.text = post.postDesc
        postTitle.text = post.title
        postImage.image = DataService.instance.imageForPath(post.imagePath)
        
    }
}
