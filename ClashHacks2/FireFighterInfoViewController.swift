//
//  FireFighterInfoViewController.swift
//  ClashHacks2
//
//  Created by Bhagat Singh on 7/2/17.
//  Copyright © 2017 com.bhagat_singh. All rights reserved.
//

import UIKit
import MKDropdownMenu
import Alamofire

class FireFighterInfoViewController: UIViewController,MKDropdownMenuDelegate,MKDropdownMenuDataSource{
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var soslabel: UILabel!
    @IBOutlet weak var sostime: UILabel!
    @IBOutlet weak var o2levels: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dropDown: MKDropdownMenu!
    let firefighters = ["Firefighter 1","Firefighter 2","Firefighter 3"]
    let images = ["1.jpg","2.jpg","3.jpg"]
    let sos = ["No", "Yes", "No"]
    let sosTime = ["10", "5", "20"]
    let o2level = ["50", "70", "20"]
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        dropDown.delegate = self
        dropDown.dataSource = self
        
    }
    
    func numberOfComponents(in dropdownMenu: MKDropdownMenu) -> Int {
        return 1
    }
    
    func dropdownMenu(_ dropdownMenu: MKDropdownMenu, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func dropdownMenu(_ dropdownMenu: MKDropdownMenu, titleForComponent component: Int) -> String? {
        return "Firefighters"
    }
    
    func dropdownMenu(_ dropdownMenu: MKDropdownMenu, titleForRow row: Int, forComponent component: Int) -> String? {
        return firefighters[row]
    }

    func dropdownMenu(_ dropdownMenu: MKDropdownMenu, didSelectRow row: Int, inComponent component: Int) {
        image.image = UIImage(named: images[row])
        soslabel.text = "Emergency SOS Done : \(sos[row])"
        sostime.text = sosTime[row]
        o2levels.text = o2level[row]
        name.text = firefighters[row]
    }
    
    func fetchData(){
        
    }
}
