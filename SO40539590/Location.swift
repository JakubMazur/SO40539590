//
//  Location.swift
//  SO40539590
//
//  Created by Jakub Mazur on 16/11/2016.
//  Copyright © 2016 wingu AG. All rights reserved.
//

import UIKit

class Location: NSObject {
    
    var title : String = String()
    var subtitle : String = String()
    var coordinates : Coordinate = Coordinate()
    
    public class func locationFromDictionary(_ dictionary : Dictionary<String, AnyObject>) -> Location {
        let location : Location = Location()
        location.title = dictionary["title"] as! String
        location.subtitle = dictionary["subtitle"] as! String
        location.coordinates = Coordinate.coordinateFromDictionary(dictionary["coordinates"] as! Dictionary<String, AnyObject>)
        return location;
    }
}
