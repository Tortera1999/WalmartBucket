//
//  ThirdViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/10/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var QuantityLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var ProductName: UITextView!
    
    var quantity11 = -1;
    var price11 = -1.2;
    var productname = "";
    var quantityArray = [Int]();
    var priceArray = [Double]();
    var productnameArray = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quantityArray.append(quantity11);
        priceArray.append(price11);
        productnameArray.append(productname);
        
        checkOutItem(walmartItem: <#T##WalmartItem#>)
        
        
        
        QuantityLabel.text = "\(quantity11)"
        PriceLabel.text = "\(price11)"
        ProductName.text = "\(productname)"

        // Do any additional setup after loading the view.
    }
    @IBAction func View(_ sender: Any) {
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
