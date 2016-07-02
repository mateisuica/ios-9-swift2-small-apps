//
//  AddRecipeVC.swift
//  Recipez
//
//  Created by Matei Suica on 6/21/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddRecipeVC: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var addImageBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImg.layer.cornerRadius = 7.0
        recipeImg.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImg.image = image
        addImageBtn.hidden = true
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipe(sender: AnyObject!) {
        if let title = recipeTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Entity(entity: entity, insertIntoManagedObjectContext: context)
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(recipeImg.image!)
            context.insertObject(recipe)
            
            do {
                try context.save()
            } catch {
                print("Could not save recipe")
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}