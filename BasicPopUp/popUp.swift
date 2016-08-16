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
    
    
    init(popUpTitle: String, popUpAddress: String){
        
        self.popUpTitle = popUpTitle;
        
        self.popUpAddress = popUpAddress;
        
    }
    
    //getters
    
    func getPopUpTitle() -> String{
        
        return popUpTitle
    
    }
    
    func getPopUpAddress() -> String{
        
        return popUpAddress
        
    }
    

    
    
    
    
    
    
    
}