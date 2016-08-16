//
//  popUp.swift
//  BasicPopUp
//
//  Created by Code on 8/9/16.
//  Copyright © 2016 caseycorvino. All rights reserved.
//

import Foundation

import MapKit

import CoreLocation

class popUp{
    
    var popUpTitle: String
    
    var popUpAddress: String
    
    var popUpLat: CLLocationDegrees
    
    var popUpLon: CLLocationDegrees
    
    
    init(popUpTitle: String, popUpAddress: String){
        
        self.popUpTitle = popUpTitle;
        
        self.popUpAddress = popUpAddress;
        
        popUpLon = 0
        
        popUpLat = 0
        
    }
    
    //getters
    
    func getPopUpTitle() -> String{
        
        return popUpTitle
    
    }
    
    func getPopUpAddress() -> String{
        
        return popUpAddress
        
    }
    

    func getPopUpLat() -> CLLocationDegrees {
        
        return popUpLat
        
        
    }
    
    func getPopUpLon() -> CLLocationDegrees {
        
        return popUpLon
        
    }
    
    
    //setter
    
    func setDetails(newAddress: String) -> Void {
        
        
        let geocoder: CLGeocoder = CLGeocoder()
                geocoder.geocodeAddressString(newAddress, completionHandler: { (placemarks, error) in
                    if(error != nil)
                    {
                        print("not valid address")
                    } else {
                        
                            let p = CLPlacemark(placemark: placemarks![0])
                        
                            var lat: CLLocationDegrees = 0
                        
                            var lon: CLLocationDegrees = 0
                        
                        
                            var subThoroughFare:String = ""
                            var thoroughFare:String = ""
                            var subLocality:String = ""
                        
                            var newAddress = ""
                        
                        
                        if p.location?.coordinate.latitude != nil{
                            
                            lat = (p.location?.coordinate.latitude)!
                            
                        }
                        
                        if p.location?.coordinate.longitude != nil{
                            
                            lon = (p.location?.coordinate.longitude)!
                            
                        }
                        
                        
                        if (p.subThoroughfare != nil){
                            
                            subThoroughFare = p.subThoroughfare!
                        }
                        
                        if (p.thoroughfare != nil){
                            
                            thoroughFare = p.thoroughfare!
                        }
                        if (p.subLocality != nil){
                            
                            subLocality = p.subLocality!
                        }

                        self.popUpLon = lon
                        self.popUpLat = lat
                        
                        newAddress = "\(subThoroughFare) \(thoroughFare), \(subLocality)"
                        self.popUpAddress = newAddress
                        
                        
                    }
                })

        
    }
    
}