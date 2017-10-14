//
//  ViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 10/14/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ClickMeButton: UIButton!
    @IBOutlet weak var WalmartLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    var count = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func ClickMeAction(_ sender: UIButton) {
     let backgroundImage1 = UIImage(named: "Image1.jpg")
    let backgroundImage2 = UIImage(named: "Image2.jpg")
        
        if(count % 2 == 0){
            backgroundImage.image = backgroundImage1
            count+=1
        }
        else{
            backgroundImage.image = backgroundImage2
            count += 1
        }
        
        
    }
}

