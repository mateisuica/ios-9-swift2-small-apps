//
//  MissingPersonCell.swift
//  Missing persons
//
//  Created by Matei Suica on 29/06/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import Foundation
import UIKit

class MissingPersonCell : UICollectionViewCell {
    @IBOutlet weak var personimg: UIImageView!
    
    let baseURL = "http://192.168.0.112:6069/img/"

    var person: Person!
    
    func configureCell(person: Person) {
        self.person = person
        if let url = NSURL(string: baseURL + person.imageUrl!) {
            downloadImage(url: url)
        }
    }
    
    func downloadImage(url: NSURL) {
        getDataFromUrl(url: url) { (data, response, error) in
            DispatchQueue.main.async(execute: {
                () -> Void in
                guard let data = data where error == nil else { return }
                self.personimg.image = UIImage(data: data as Data)
                self.person.image = self.personimg.image

            })
        }
    }
    
    func setSelected() {
        self.person.downloadFaceId()
        personimg.layer.borderWidth =  2.0
        personimg.layer.borderColor = UIColor.purple().cgColor
    }
    
    func getDataFromUrl(url: NSURL, completion: ((data:NSData?, response: URLResponse?, error: NSError?) -> Void)) {
        URLSession.shared().dataTask(with: url as URL) {
            (data, response, error) in
                completion(data: data, response: response, error: error)
        }.resume()
    }
}
