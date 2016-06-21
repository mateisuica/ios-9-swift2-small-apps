//
//  ViewController.swift
//  DefaultsAreFun
//
//  Created by Matei Suica on 6/20/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favColorLabe: UILabel!
    
    var people = [Person]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            favColorLabe.text = "Favorite color: \(color)"
        } else {
            favColorLabe.text = "Pick a color!"
        }
        
        let personA = Person(first: "Wing", last: "Chun")
        let personB = Person(first: "Lady", last: "Gaga")
        let personC = Person(first: "Justin", last: "Bieber")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redAction(sender: AnyObject) {
        favColorLabe.text = "Favorite color red"
        NSUserDefaults.standardUserDefaults().setValue("red", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    @IBAction func yellowAction(sender: AnyObject) {
        favColorLabe.text = "Favorite color yellow"
        NSUserDefaults.standardUserDefaults().setValue("yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func blueAction(sender: AnyObject) {
        favColorLabe.text = "Favorite color blue"
        NSUserDefaults.standardUserDefaults().setValue("blue", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                for person in peopleArray {
                    print(person.firstName + " " + person.lastName)
                }
            }
        }
    }
    
    
}

