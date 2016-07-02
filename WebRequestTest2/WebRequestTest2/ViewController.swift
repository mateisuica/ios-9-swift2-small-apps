//
//  ViewController.swift
//  WebRequestTest2
//
//  Created by Matei Suica on 26/06/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let urlStrinf = "http://swapi.co/api/people/1/"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlStrinf)!
        
        session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            if let responseData = data {
                do {
                 let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    if let dict = json as? Dictionary<String, AnyObject> {
                        
                        if let name = dict["name"] as? String, let height = dict["height"] as? String, let birth = dict["birth_year"] as? String, let hair = dict["hair_color"] as? String {
                            let person = Person(name: name, height: height, birthYear: birth, hairColor: hair)
                            print(person.name)
                            
                        }
                    }
                } catch {
                    print("Could not serialize")
                }
            }
        }.resume()
    }

}

