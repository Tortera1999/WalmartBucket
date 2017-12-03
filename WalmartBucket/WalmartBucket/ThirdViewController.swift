//
//  ThirdViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/10/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

var checkOutItems = [checkOutItem]();

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var checkOutTableView: UITableView!

    
    var quantity11 = -1;
    var price11 = -1.2;
    var product : WalmartItem!;
    static var neededUrl : String = "";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        checkOutItems.removeAll();
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
        return checkOutItems.count;
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkOutCell", for: indexPath) as! CheckoutItemCell
        cell.nameLabel?.text = checkOutItems[indexPath.row].walmartItem.name;
        cell.priceLabel?.text = "\(checkOutItems[indexPath.row].price)";
        cell.quantityLabel.text = "\(checkOutItems[indexPath.row].quantity)";
        print(checkOutItems[indexPath.row].price)
        
        ThirdViewController.neededUrl = String(describing: checkOutItems[indexPath.row].walmartItem.itemUrl);
        return cell
    }
    
    
   
    @IBAction func toSearchView(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "toFirst", sender: self)
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
