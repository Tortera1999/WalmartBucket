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
    var images = [UIImage]();
    var names = [String]();
    var selectedIndex = -1;
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return walmart.count;
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemHolder", for: indexPath)
        
//        cell.imageView?.image = walmart[indexPath.row].image!;
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
        
        let image1 = UIImage(named: "Image1.jpg");
        let image2 = UIImage(named: "Image2.jpg");
        let image3 = UIImage(named: "Image3.jpg");
        let image4 = UIImage(named: "Image4.jpg");
        let image5 = UIImage(named: "Image5.jpg");
        
        images.append(image1!);
        images.append(image2!);
        images.append(image3!);
        images.append(image4!);
        images.append(image5!);
        
        
        //Start of Api
        
        let url = URL(string: "http://api.walmartlabs.com/v1/search?query=ipod&format=json&apiKey=c6qjh9bqwyhuc5xgtu7fywre");
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
                                let price = dict["salePrice"] as! Double
                                let cartURL = dict["addToCartUrl"] as! String
                                let itemURL = dict["productUrl"] as! String
                                let description = dict["shortDescription"] as! String
                                let imageURL = dict["largeImage"] as! String
                                
                                
                                let item = WalmartItem(name: name, price: price, description: description, imageURL: imageURL, addToCartURL: cartURL, itemURL: itemURL)
                                
                                self.walmart.append(item)
//                                let name = dict["name"] as? String
//                                self.names.append(name!);
                            }
                            print(self.names);
                            
                            self.callTableView.reloadData()
                            
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

