//
//  RecipeCell.swift
//  Recipez
//
//  Created by Matei Suica on 6/21/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import Foundation
import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    
    func configureCell(recipe: Entity) {
        recipeTitle.text = recipe.title
        recipeImg.image = recipe.getRecipeImg()
    }
}