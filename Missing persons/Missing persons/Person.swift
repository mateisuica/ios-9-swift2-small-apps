//
//  Person.swift
//  Missing persons
//
//  Created by Matei Suica on 02/07/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import Foundation
import UIKit
import ProjectOxfordFace

class Person {
    var faceId: String?
    var image: UIImage?
    var imageUrl: String?
    
    init(personImageUrl: String) {
        self.imageUrl = personImageUrl
    }
    
    func downloadFaceId() {
        if let img = image, let imageUrl = UIImageJPEGRepresentation(img, 0.8) {
            FaceService.instange.client?.detect(with: imageUrl, returnFaceId: true, returnFaceLandmarks: false, returnFaceAttributes: nil, completionBlock:
                {(faces:[MPOFace]?,err: NSError?) in
                if err == nil {
                    var faceId: String?
                    for face in faces! {
                        faceId = face.faceId
                        print("FaceID: \(faceId)")
                        break
                    }
                    self.faceId = faceId
                }
            
            }).resume()
        }
    }
}
