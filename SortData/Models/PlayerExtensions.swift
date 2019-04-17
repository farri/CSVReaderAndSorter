//
//  PlayerExtensions.swift
//  SortData
//
//  Created by Mac on 4/4/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation



extension Array where Element == Player {
    
    
    //sort array based on sortOn string option and return sorted array
    func sort(sortOn : String) -> [Player] {
        
        //self will have original array
        
        var sortedArray : [Player] = self
        
        switch sortOn {
        case "NameA":
            sortedArray = self.sorted { (id1, id2) -> Bool in
                return id1.fullName! < id2.fullName! // Use < for Descending order
            }
        case "NameD":
            sortedArray = self.sorted { (id1, id2) -> Bool in
                return id1.fullName! > id2.fullName! // Use > for Descending order
            }
        case "CountryA":
            sortedArray = self.sorted { (id1, id2) -> Bool in
                return id1.country! < id2.country! // Use > for Descending order
            }
        case "CountryD":
            sortedArray = self.sorted { (id1, id2) -> Bool in
                return id1.country! > id2.country! // Use > for Descending order
            }
        case "DateA":
            sortedArray = self.sorted { (id1, id2) -> Bool in
                return id1.dateOfBirth! > id2.dateOfBirth! // Use > for Descending order
            }
        case "DateD":
            sortedArray = self.sorted { (id1, id2) -> Bool in
                return id1.dateOfBirth! < id2.dateOfBirth! // Use > for Descending order
            }
        case "WeightA":
            sortedArray = self.sorted { (id1, id2) -> Bool in
                return id1.weight! > id2.weight! // Use > for Descending order
            }
        case "WeightD":
            sortedArray = self.sorted { (id1, id2) -> Bool in
                return id1.weight! < id2.weight! // Use > for Descending order
            }
            
        default:
            print("nothing to sort")
        }
        
        return sortedArray
        
    }
    
}
