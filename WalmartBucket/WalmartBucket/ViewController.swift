//
//  ViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 10/14/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var images = [UIImage]();
    var names = [String]();
    var selectedIndex = -1;
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5;
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemHolder", for: indexPath)
        
        cell.imageView?.image = images[indexPath.row];
        cell.imageView?.contentMode = .scaleAspectFill;
        cell.textLabel?.text = names[indexPath.row];
        
        
        return cell;
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row;
        self.performSegue(withIdentifier: "firstSegue", sender: self)
        
    }

    
    
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
        
        names.append("A");
        names.append("B");
        names.append("C");
        names.append("D");
        names.append("E");
        
        
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
                            print(query[0]);
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
            
            secondViewController.images = images[selectedIndex]
            secondViewController.names = names[selectedIndex]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

