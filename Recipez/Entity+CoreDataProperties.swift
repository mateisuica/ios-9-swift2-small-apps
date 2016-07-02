//
//  Entity+CoreDataProperties.swift
//  Recipez
//
//  Created by Matei Suica on 6/21/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entity {

    @NSManaged var image: NSData?
    @NSManaged var ingredients: String?
    @NSManaged var steps: String?
    @NSManaged var title: String?

}
