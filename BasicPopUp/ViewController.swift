//
//  ViewController.swift
//  BasicPopUp
//
//  Created by Code on 8/5/16.
//  Copyright © 2016 caseycorvino. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation


var popUps = [popUp]()

class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    
    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager() //instantiating user location
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //user location setup
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        sleep(1)
        
        locationManager.stopUpdatingLocation()
        
        
        
        
        //end of setup
        
    }
    
    
    
    @IBAction func updateButton(sender: AnyObject) {
        updateLocation()
        //updatePopUps()
        
        
        
    }
    
    
    func updateLocation(){
        
        locationManager.startUpdatingLocation()//this runs locationManager()
        
        sleep(1)
        
        locationManager.stopUpdatingLocation()
        
    }
    
    func deleteAllAnnotations(){
        
        let allAnnotations = self.map.annotations
        
        self.map.removeAnnotations(allAnnotations)
        
    }
    
    func updatePopUps(){
        
        //get the PopUps in the area 3 miles
        
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //print(locations)
        
        deleteAllAnnotations()//deleteAllPopUps() too
        
        
        
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        
        let longitude = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.1; //zoom
        
        let lonDelta:CLLocationDegrees = 0.1; //zoom
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta); //map span using zooms
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: false)
        
        self.map.showsUserLocation = true
        
        //let currentLocation = MKPointAnnotation()
        
        /*
         currentLocation.coordinate = location
         
         currentLocation.subtitle = "current location"
         
         map.addAnnotation(currentLocation)
         */
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

