//
//  ViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 10/14/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var walmart = [WalmartItem]();
    var selectedIndex = -1;
    var searchItems = "";
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return walmart.count;
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemHolder", for: indexPath)
        
        cell.imageView?.image = walmart[indexPath.row].image!;
        cell.imageView?.contentMode = .scaleAspectFill;
        cell.textLabel?.text = walmart[indexPath.row].name;
        
        
        return cell;
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row;
        self.performSegue(withIdentifier: "firstSegue", sender: self)
        
    }

    @IBOutlet weak var callTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Start of Api
        
        let url = URL(string: "http://api.walmartlabs.com/v1/search?query=\(searchItems)&format=json&apiKey=c6qjh9bqwyhuc5xgtu7fywre");
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        
            if error != nil {
                print("There is an error");
            }
            else{
                if data != nil {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        if let query = jsonResult["items"] as? NSArray{
                            for queryElement in query{
                                guard let dict = queryElement as? NSDictionary else{
                                    print("Couldnt retrieve dictionary")
                                    return;
                                }
                                let name = dict["name"] as! String
                                var price = dict["salePrice"] as? Double
                                price = (price == nil) ? dict["msrp"] as! Double : price
                                let cartURL = dict["addToCartUrl"] as! String
                                let itemURL = dict["productUrl"] as! String
                                
                                var description = dict["shortDescription"] as? String
                                
                                description = description?.replacingOccurrences(of: "&lt;p&gt;", with: "", options: .regularExpression, range: nil)
                                
                                description = description?.replacingOccurrences(of: "&quot;", with: "", options: .regularExpression, range: nil)
                                
                                description = description?.replacingOccurrences(of: "Product Description", with: "", options: .regularExpression, range: nil)

                                
                                description = (description == nil) ? "" : description
                                
                                
                                let imageURL = dict["largeImage"] as! String
                                
                                let walmartId = dict["itemId"] as! Int
                                let item = WalmartItem(name: name, price: price!, description: description!, imageURL: imageURL, addToCartURL: cartURL, itemURL: itemURL, walmartId: walmartId)
                                
                                self.walmart.append(item)
//                                let name = dict["name"] as? String
//                                self.names.append(name!);
                            }
                            print(self.walmart);
                            
                            DispatchQueue.main.async {
                                self.callTableView.reloadData()
                            }
                            
//                            guard let dict = query[0] as? NSDictionary else {
//                                print("Could not convert to dictionary")
//                                return;
//                            }
//                            print(dict["name"]!)
                        }
                    }
                    catch {
                        print("JSON cant be processed");
                    }
                }
            }
        }
        
        task.resume();
        
        //End of API
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue" {
            let secondViewController = segue.destination as! SecondViewController;
            
//            secondViewController.images = images[selectedIndex]
            secondViewController.walmart = walmart[selectedIndex]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

