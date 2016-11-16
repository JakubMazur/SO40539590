//
//  Coordinate.swift
//  SO40539590
//
//  Created by Jakub Mazur on 16/11/2016.
//  Copyright © 2016 wingu AG. All rights reserved.
//

import UIKit

class Coordinate: NSObject {
    
    var latitude : Float = Float()
    var longitude : Float = Float()
    
    public class func coordinateFromDictionary(_ dictionary : Dictionary<String, AnyObject>) -> Coordinate {
        let coordinate : Coordinate = Coordinate()
        coordinate.latitude = dictionary["lat"] as! Float
        coordinate.longitude = dictionary["lon"] as! Float
        return coordinate
    }
}
