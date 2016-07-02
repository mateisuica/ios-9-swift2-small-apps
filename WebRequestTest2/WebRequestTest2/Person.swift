//
//  Person.swift
//  WebRequestTest2
//
//  Created by Matei Suica on 26/06/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import Foundation

class Person {
    private var _name: String!
    private var _height: String!
    private var _birthYear: String!
    private var _hairColor: String!
    
    var name: String {
        return _name
    }
    
    var height: String {
        get {
            return _height
        }
    }
    
    var birthYear: String {
        return _birthYear
    }
    
    var hairColor: String {
        return _hairColor
    }
    
    init(name: String!, height: String, birthYear: String, hairColor: String) {
        _name = name
        _birthYear = birthYear
        _height = height
        _hairColor = hairColor
    }
}