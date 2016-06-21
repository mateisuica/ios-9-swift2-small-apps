//
//  MyTableViewCell.swift
//  MateysTableView
//
//  Created by Matei Suica on 6/20/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImg.layer.cornerRadius = 5.0
        mainImg.clipsToBounds = true
        
        // Initialization code
    }

    func configureCell(image: UIImage, text: String) {
        mainImg.image = image
        mainLbl.text = text
        
    }

}
