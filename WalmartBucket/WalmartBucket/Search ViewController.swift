//
//  Search ViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/26/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

class Search_ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SearchItems: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SearchItems.delegate = self;
        
        // Do any additional setup after loading the view.
    }
    @IBAction func Submit(_ sender: Any) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "searchSegue" {
                let viewController = segue.destination as! ViewController;
                viewController.searchItems = String(describing: SearchItems)
            }
        }
        
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
