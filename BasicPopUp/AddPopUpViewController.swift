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



class AddPopUpViewController:UIViewController{


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
        
        
       isValidTitle(popUpTitleString!)
           
        isValidLengthAddress(popUpAddressString!)
       
        
        let geocoder: CLGeocoder = CLGeocoder()
        
        if isValidTitle(popUpTitleString!) && isValidLengthAddress(popUpAddressString!){
        geocoder.geocodeAddressString(popUpAddressString!)  { (placemark, error) in
            
            if error != nil {
                
                print("Not valid address")
                
                self.warning2.text = "Not valid address"
                
            }
            else {
                
                    let newPopUp = popUp(popUpTitle: popUpTitleString!, popUpAddress: popUpAddressString!)
                    
                    popUps.append(newPopUp)
                    
                    
                    self.performSegueWithIdentifier("back", sender: nil)
                    
                    //print(popUps.count)
                    
                
            }
        }
        }
        

    
        
    }
    
    func isValidTitle(newTitle: String) -> Bool{
        
        
        
        if newTitle.characters.count > 3 {
            
            warning.text = ""
            
            return true
        
        }  else  {
            
            warning.text = "Title needs to be longer than 3 characters"
            
            return false
        }
    }

    
    func isValidLengthAddress(newAddress: String) -> Bool {

        if newAddress.characters.count > 8 {
            
            warning2.text = ""
            
            return true
            
        }  else  {
            
            warning2.text = "Address needs to be longer than 8 characters"
            
            return false
        }
        
        
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
