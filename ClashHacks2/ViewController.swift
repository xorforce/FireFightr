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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plotMap()
        Timer.every(3.5.seconds) { 
            self.plotMarker()
            self.fetchData()
            
        }
    }

    func plotMap(){
        let camera = GMSCameraPosition.camera(withLatitude: 28.5363, longitude: 77.2706, zoom: 21.0)
        let frame = CGRect(x: 16, y: 115, width: 343, height: 532)
        mapView = GMSMapView.map(withFrame: frame, camera: camera)
        view = mapView
    }
    
    func plotMarker(){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 28.5363, longitude: 77.2706)
        marker.title = "Fire Man"
        marker.map = mapView
    }
    
    func fetchData(){
        Alamofire.request("http://twentyeight10.tech/clashhacks3/get", method: .get).responseJSON { (response) in
            let result = response.result.value
            print(result)
        }
    }
    
}

