//
//  Meme.swift
//  MemeMe
//
//  Created by Matei Suica on 04/03/16.
//  Copyright © 2016 QuadroQ. All rights reserved.
//

import Foundation
import UIKit


struct Meme {
    
    var topText : String
    var bottomText :String
    var originalImage : UIImage
    var memedImage : UIImage
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
    
    
    
}