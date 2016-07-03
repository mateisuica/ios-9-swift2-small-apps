//
//  Pokemon.swift
//  pokedex
//
//  Created by Matei Suica on 02/07/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import Foundation
import Alamofire


class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defence: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoText: String!
    private var _nextEvoId: String!
    private var _nextEvoLvl: String!
    private var _resourceUrl: String!
    
    var description: String {
        if _description == nil {
            return ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            return ""
        }
        return _type
    }
    
    var height: String {
        if _height == nil {
            return ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            return ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            return ""
        }
        return _attack
    }
    
    var defence: String {
        if _defence == nil {
            return ""
        }
        return _defence
    }


    var nextEvoText: String {
        if _nextEvoText == nil {
            return ""
        }
        return _nextEvoText
    }
    
    var nextEvoId: String {
        get {
            if _nextEvoId == nil {
                return ""
            }
            return _nextEvoId
        }
        
    }
    
    var nextEvoLvl: String {
        get {
            if _nextEvoLvl == nil {
                return ""
            }
            return _nextEvoLvl
        }
    }
    
    var name: String {
        if _name == nil {
            return ""
        }
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }

    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        _resourceUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId!)/"
    }
    func downloadPokemonDetails(completed: DownloadComplete) {
        Alamofire.request(.GET, _resourceUrl).responseJSON { (response: Response<AnyObject, NSError>) in
            let result = response.result
//            print(result.value.debugDescription)
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let defence = dict["defense"] as? Int {
                    self._defence = "\(defence)"
                }
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        Alamofire.request(.GET, "\(URL_BASE)\(url)").responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) in
                            let descResult = response.result
                            if let descDict = descResult.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    self._description = description
    
                                }
                            }
                            completed()
                        })
                    } else {
                        self._description = ""
                    }
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0 {
                    if let to = evolutions[0]["to"] as? String {
                        if to.range(of: "mega") == nil {
                            //can't support mega-pokemons right now
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "").replacingOccurrences(of: "/", with: "")
                                self._nextEvoId = newStr
                                self._nextEvoText = to
                            }
                        }
                    }
                    if let level = evolutions[0]["level"] as? Int {
                        self._nextEvoLvl = "\(level)"
                    }
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    if let type = types[0]["name"] {
                        self._type = type
                    }
                    if types.count > 1 {
                        for x in 1...types.count - 1 {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name)"
                            }
                        }
                    }
                    
                } else {
                    self._type = ""
                }
            }
        
        }
    }
}
