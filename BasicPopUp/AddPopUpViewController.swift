//
//  AddPopUpViewController.swift
//  BasicPopUp
//
//  Created by Code on 8/5/16.
//  Copyright © 2016 caseycorvino. All rights reserved.
//

import UIKit

import MapKit

import CoreLocation



class AddPopUpViewController:UIViewController, CLLocationManagerDelegate, MKMapViewDelegate
{


    @IBOutlet var popUpTitle: UITextField!
    
    @IBOutlet var popUpAddress: UITextField!
    
    @IBOutlet var warning: UILabel!
    
    @IBOutlet var warning2: UILabel!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        warning.text = ""
        warning2.text = ""
        
        //print(popUps.count)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddPopUp(sender: AnyObject) {
        
        let popUpTitleString = popUpTitle.text
        
        let popUpAddressString = popUpAddress.text
        
        
        
       
        
        
        
        if isValidTitle(popUpTitleString!) && isValidLengthAddress(popUpAddressString!)        {
        
            let newPopUp = popUp(popUpTitle: popUpTitleString!, popUpAddress: popUpAddressString!)
        
            popUps.append(newPopUp)
        
        
            performSegueWithIdentifier("back", sender: nil)
        
            //print(popUps.count)
        
        }
    
        
    }
    
    func isValidTitle(newTitle: String) -> Bool{
        
        if newTitle.characters.count > 3 {
            
            return true
        
        }  else  {
            
            warning.text = "Title needs to be longer than 3 characters"
            
            return false
        }
    }
    
//    func isValidLengthAddress(newAddress: String) -> Bool{
//        
//        typealias CompletionHandler = (success:Bool) -> Void
//        
//        func checkIfItIsValid(newAddress: String,completionHandler: CompletionHandler) -> Bool{
//             let geocoder: CLGeocoder = CLGeocoder()
//            geocoder.geocodeAddressString(newAddress)  { (placemark, error) in
//                
//                            if error != nil {
//                
//                                    print("Not valid address")
//                                
//                            }
//                
//                        }
//
//            let flag = true // true if download succeed,false otherwise
//            
//            completionHandler(success: flag)
//        }
//        
//        // How to use it.
//        
//        checkIfItIsValid(newAddress, completionHandler: { (success) -> Bool in
//            
//            // When download completes,control flow goes here.
//            if success {
//                
//                return true
//                
//            } else {
//                
//            }
//        })
//        
//        
//        return false
//        
//    }
    
    func isValidLengthAddress(newAddress: String) -> Bool {
        
        
         let geocoder: CLGeocoder = CLGeocoder()

        
        
        
        
        geocoder.geocodeAddressString(newAddress)  { (placemark, error) in
            
            if error != nil {
                
                print("Not valid address")
                
            }
            else{
                
            }
        }
        
       
    
//        if state == "false" {
//            
//            print( "false")
//            warning2.text = "Not valid address"
//            return false;
//        }

        if newAddress.characters.count > 8 {
            
            return true
            
        }  else  {
            
            warning2.text = "Address needs to be longer than 8 characters"
            
            return false
        }
        
        
    
    }
    
//    func isValidAddress(newAddress: String) -> Bool {
//        
//        let geocoder: CLGeocoder = CLGeocoder()
//        
//        var st = true
//        geocoder.geocodeAddressString(newAddress, completionHandler: { (placemark, error) in
//            if(error != nil)
//            {
//                st = false
//                //return false
//                print("not valid address")
//            }
//        })
//        
//        return st
//        
//        
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
