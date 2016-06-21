//
//  AddPostVC.swift
//  My Hoood
//
//  Created by Matei Suica on 6/20/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var imgPicker: UIImagePickerController!
    
    @IBAction func makePostPressed(sender: AnyObject) {
        if let title = titleField.text, let desc = descriptionField.text, image = postImage.image {
            
            let imagePath = DataService.instance.saveImageAndCreatePath(image)
            let post = Post(path: imagePath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPictureButtonPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.layer.cornerRadius = postImage.frame.width / 2
        postImage.clipsToBounds = true
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
    }
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
}
