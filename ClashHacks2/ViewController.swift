//
//  ViewController.swift
//  ClashHacks2
//
//  Created by Bhagat Singh on 7/2/17.
//  Copyright © 2017 com.bhagat_singh. All rights reserved.
//

import UIKit
import GoogleMaps
import SwiftyTimer
import Alamofire

class ViewController: UIViewController {

    var mapView: GMSMapView?
    var lat : String?
    var long : String?
    let arr = [0.0001, -0.0001]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plotMap()
        
        plotMarker(fighter:"fighter1",value: 0.0000)
        plotMarker(fighter:"fighter2",value: 0.00003)
        plotMarker(fighter:"fighter4",value: 0.00015)
        plotMarker(fighter:"fighter3",value: 0.00038)
        
    }

    func plotMap(){
        
        let camera = GMSCameraPosition.camera(withLatitude: 28.5363, longitude: 77.2706, zoom: 21.0)
        let frame = CGRect(x: 16, y: 115, width: 343, height: 532)
        mapView = GMSMapView.map(withFrame: frame, camera: camera)
        view = mapView
    }
    
    func plotMarker(fighter:String, value: Double){
        let marker = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: Double(28.5363+value), longitude: Double(77.2706+value))
        marker.title = fighter
        marker.map = mapView
    }
    
    func fetchData(){
        Alamofire.request("http://twentyeight10.tech/clashhacks3/get", method: .get).responseJSON { (response) in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let latitude = dict["latitutde"] as? String{
                    self.lat = (latitude)
                }
                if let longitude = dict["longitude"] as? String{
                    self.long = (longitude)
                }
            }
            
        }
        
    }
    
}

