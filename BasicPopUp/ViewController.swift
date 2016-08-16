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
        updatePopUps()
        
        
        
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
        
        //get the PopUps in the area x miles. x is how far the user is willing to go. for example, the user will choose a shorter distance in nyc than la
        for i in 0 ..< popUps.count{
            let p = popUps[i]
            //create annotations
            createAnnotation(p)
            
        }
        
        
    }
    
    func createAnnotation(p: popUp){
        

        
        let title = p.getPopUpTitle()
        
        
        
        let geocoder: CLGeocoder = CLGeocoder()
        geocoder.geocodeAddressString(p.getPopUpAddress(), completionHandler: { (placemarks, error) in
            if(error != nil)
            {
               //print("not valid address")
            } else {
                
                let p = CLPlacemark(placemark: placemarks![0])
                
                var lat: CLLocationDegrees = 0
                
                var lon: CLLocationDegrees = 0
                
                
                var subThoroughFare:String = ""
                var thoroughFare:String = ""
                var locality:String = ""
                
                var newAddress = ""
                
                
                if p.location?.coordinate.latitude != nil{
                    
                    lat = (p.location?.coordinate.latitude)!
                    
                    //print(lat)
                    
                }
                
                if p.location?.coordinate.longitude != nil{
                    
                    lon = (p.location?.coordinate.longitude)!
                    //print(lon)
                    
                }
                
                
                if (p.subThoroughfare != nil){
                    
                    subThoroughFare = p.subThoroughfare!
                }
                
                if (p.thoroughfare != nil){
                    
                    thoroughFare = p.thoroughfare!
                }
                if (p.locality != nil){
                    
                    locality = p.locality!
                }
                
                if thoroughFare != "" && subThoroughFare != "" {
                    
                    newAddress = "\(subThoroughFare) \(thoroughFare), \(locality)"
                
                } else if thoroughFare != ""{
                    
                    newAddress = "\(thoroughFare), \(locality)"
                    
                
                } else {
                    
                    newAddress = "\(locality)"
                
                }
                
                let newCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                
                //print(lat)
                //print(lon)
                
                        let annotation = MKPointAnnotation()
                
                        annotation.coordinate = newCoordinate
                
                        annotation.title = title
                
                        annotation.subtitle = newAddress
                        
                        self.map.addAnnotation(annotation)

                
            }
        })
        
        
        
        
        
        
        
        
        
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //print(locations)
        
        deleteAllAnnotations()//deleteAllPopUps() too
        updatePopUps()
        
        
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        
        let longitude = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.2; //zoom
        
        let lonDelta:CLLocationDegrees = 0.2; //zoom
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta); //map span using zooms
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: false)
        
        self.map.showsUserLocation = true
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

