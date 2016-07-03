//
//  ViewController.swift
//  Missing persons
//
//  Created by Matei Suica on 29/06/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import UIKit
import ProjectOxfordFace

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var selectedImg: UIImageView!
    @IBOutlet weak var missingPersonCollection: UICollectionView!
    
    var selectedPortion: Person?
    var hasSelectedImage: Boolean = false
    
    let imagePicker = UIImagePickerController()
  
    
    let missingPerson = [
        Person(personImageUrl: "person1.jpg"),
        Person(personImageUrl: "person2.jpg"),
        Person(personImageUrl: "person3.jpg"),
        Person(personImageUrl: "person4.jpg"),
        Person(personImageUrl: "person5.jpg"),
        Person(personImageUrl: "person6.png"),
        Person(personImageUrl: "person7.jpg"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        missingPersonCollection.delegate = self
        missingPersonCollection.dataSource = self
          let tap = UITapGestureRecognizer(target: self, action:#selector(loadPicker(gesture:)))
        tap.numberOfTapsRequired = 1
        selectedImg.addGestureRecognizer(tap)
        imagePicker.delegate = self
    }
    @IBAction func checkForMatch(_ sender: AnyObject) {
        if selectedPortion == nil || selectedImg.image == nil {
            showErrorAlert()
        } else {
            if let myImg = selectedImg.image, let imgData = UIImageJPEGRepresentation(myImg, 0.8) {
                FaceService.instange.client?.detect(with: imgData, returnFaceId: true, returnFaceLandmarks: false, returnFaceAttributes: nil, completionBlock: {(faces:[MPOFace]?, err: NSError?) in
                    
                    if err == nil {
                        var faceId: String?
                        for face in faces! {
                            faceId = face.faceId
                            break
                        }
                        
                        if faceId != nil {
                            FaceService.instange.client?.verify(withFirstFaceId: self.selectedPortion?.faceId, faceId2: faceId, completionBlock: { (result: MPOVerifyResult?, err: NSError?) in
                                
                                if let isIdentical  = result?.isIdentical, confidence = result?.confidence as? Float {
                                    let isSame = (isIdentical ? "is" : "is not")
                                    let alert = UIAlertController(title: "Results", message: "You look \(confidence * 100)% alike. It \(isSame) the same person." , preferredStyle: UIAlertControllerStyle.alert)
                                    let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { (action: UIAlertAction) in
                                        self.dismiss(animated: true, completion: nil)
                                    })
                                    alert.addAction(action)
                                    self.present(alert, animated: true, completion:  nil)
                                }

                            }).resume()
                        }
                    }
                    
                    
                }).resume()
            }
        }
        
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Select person & Image", message: "Please select a missing person to check and an image to match", preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missingPerson.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = missingPersonCollection.dequeueReusableCell(withReuseIdentifier: "missingPerson", for: indexPath) as? MissingPersonCell
        
        let url = missingPerson[indexPath.row]
        cell?.configureCell(person: url)
        return cell!
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImg.image = pickedImage
            hasSelectedImage = true
            dismiss(animated: true, completion: nil)
        }
    }
    
    func loadPicker(gesture: UITapGestureRecognizer) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedPortion = missingPerson[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath) as? MissingPersonCell
        cell?.configureCell(person: selectedPortion!)
        cell?.setSelected()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? MissingPersonCell
        cell?.configureCell(person: selectedPortion!)
        cell?.setDeselected()
    }

}

