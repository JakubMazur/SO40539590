//
//  ViewController.swift
//  SO40539590
//
//  Created by Jakub Mazur on 16/11/2016.
//  Copyright © 2016 wingu AG. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: Override setter
    var locationsDatabase : Array<Location> = [] {
        didSet {
            self.displayArray = self.locationsDatabase
        }
    }
    var displayArray : Array<Location> = [] {
        didSet {
            self.mapView .removeAnnotations(self.mapView.annotations)
            for location in displayArray {
                let coords : Coordinate = location.coordinates
                let point = MKPointAnnotation()
                point.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(coords.latitude),CLLocationDegrees(coords.longitude))
                point.title = location.title
                point.subtitle = location.subtitle
                mapView.addAnnotation(point)
            }
        }
    }
    
    //MARK: VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationsDatabase = self.readJsonDB()
    }
    
    //MARK: Reading your db
    
    func readJsonDB() -> Array<Location> {
        var tempArray : Array = Array<Location>()
        let path = Bundle.main.path(forResource: "db", ofType: "json")
        var fileContent : NSString? = nil
        do {
            fileContent = try String(contentsOfFile: path!) as NSString?
            let data = fileContent?.data(using: String.Encoding.utf8.rawValue)
            let output : Array = try JSONSerialization.jsonObject(with: data!, options:.mutableContainers) as! Array<Dictionary<String,AnyObject>>
            for locationDic in output {
                let myLocation : Location = Location.locationFromDictionary(locationDic)
                tempArray.append(myLocation)
            }
        } catch {
            /* catch code - handle it when sth is wrong with your 
             db.json, but since it static and it's only demo purposes
             i will leave catch empty.
             */
        }
        return tempArray
    }
    
    //MARK: Search
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.displayArray = self.locationsDatabase.filter() {
            return $0.title.contains(searchBar.text!)
        }
    }

}
