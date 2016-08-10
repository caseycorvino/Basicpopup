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
    
    //setters
    
    func setPopUpLat(lat: CLLocationDegrees){
        
        popUpLat = lat
        
    }
    
    func setPopUpLan(lan: CLLocationDegrees){
        
        popUpLon = lan
        
    }
    
    
    
}