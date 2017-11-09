//
//  secondViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/8/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var names = "";
    var images = UIImage();
    
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ImageViewOutlet.image = images;
        Label.text = names;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
