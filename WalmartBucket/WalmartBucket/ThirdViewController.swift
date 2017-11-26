//
//  ThirdViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/10/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var checkOutTableView: UITableView!

    
    var quantity11 = -1;
    var price11 = -1.2;
    var product : WalmartItem!;
    
    var checkOutItems = [checkOutItem]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkOutItems.removeAll();
    
        
        //QuantityLabel.text = "\(quantity11)"
        //PriceLabel.text = "\(price11)"
        //ProductName.text = "\(productname)"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkOutItems.append(checkOutItem(walmartItem: product, price: price11, quantity: quantity11))
    }
    @IBAction func View(_ sender: Any) {
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Tableview methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkOutItems.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkOutCell", for: indexPath) as! CheckoutItemCell
        return cell
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
