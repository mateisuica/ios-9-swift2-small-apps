//
//  ViewController.swift
//  MemeMe
//
//  Created by Matei Suica on 04/03/16.
//  Copyright © 2016 QuadroQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var topToolbar: UIToolbar!
    @IBOutlet weak var bottomtoolbar: UIToolbar!
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : -3.0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerView.contentMode = UIViewContentMode.Center
        topText.defaultTextAttributes = memeTextAttributes
        topText.textAlignment = NSTextAlignment.Center
        bottomText.defaultTextAttributes = memeTextAttributes
        bottomText.textAlignment = NSTextAlignment.Center
        topText.delegate = self
        bottomText.delegate = self
        shareButton.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    
    func generateMemedImage() -> UIImage {
        
        topToolbar.hidden = true
        bottomtoolbar.hidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawViewHierarchyInRect(self.view.frame,
            afterScreenUpdates: true)
        let memedImage : UIImage =
        UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        topToolbar.hidden = false
        bottomtoolbar.hidden = false
        
        
        return memedImage
    }
    
    


    @IBAction func pickAction(sender: UIBarButtonItem) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func camerAction(sender: UIBarButtonItem) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func shareAction(sender: UIBarButtonItem) {
        let image = generateMemedImage()
        save(image)
        let shareController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        shareController.completionWithItemsHandler =  {(test :String?, test2: Bool, test3: [AnyObject]?, error: NSError?) -> Void in
            shareController.dismissViewControllerAnimated(true, completion: nil) }
        self.presentViewController(shareController, animated: true, completion: nil)
        
    }
    
    func keyboardWillShow(notification: NSNotification) {
         view.frame.origin.y -= getKeyboardHeight(notification)

    }
    func keyboardWillHide(notification: NSNotification) {
          view.frame.origin.y += getKeyboardHeight(notification)

    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                imagePickerView.image = image
                shareButton.enabled = true
                imagePickerView.contentMode = UIViewContentMode.ScaleAspectFill
            }
            
            picker.dismissViewControllerAnimated(true, completion: nil)
            
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func save(memedImage: UIImage) {
        //Create the meme
        let meme = Meme( topText: topText.text!, bottomText: bottomText.text!, originalImage:
            imagePickerView.image!, memedImage: memedImage)
        
        // Add it to the memes array in the Application Delegate
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
        
        performSegueWithIdentifier("afterSaveSegue", sender: self)
    }
    

}

