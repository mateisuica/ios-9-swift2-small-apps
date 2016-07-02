//
//  Entity.swift
//  Recipez
//
//  Created by Matei Suica on 6/21/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Entity: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    func setRecipeImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImg() -> UIImage? {
        let img = UIImage(data: self.image!)
        return img
    }
}
