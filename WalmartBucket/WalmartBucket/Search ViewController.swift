//
//  Search ViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/26/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

var searchItem = ""
class Search_ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SearchItems: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SearchItems.delegate = self;


        
        // Do any additional setup after loading the view.
    }
//    @IBAction func Submit(_ sender: Any) {
//        
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
            if segue.identifier == "searchSegue" {
                let viewController = segue.destination as! ViewController;
                var search = SearchItems.text!;
                search = search.components(separatedBy: .whitespaces).joined()
                viewController.searchItems = search;
                print(search)
//                searchItem = SearchItems.text!
            }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func unWindFromThirdView(segue: UIStoryboardSegue) {
        
    }
    
}
