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
    var price = -1;
    
    
    @IBOutlet weak var TextViewForPrice: UITextView!
    @IBOutlet weak var quantityTextField: UITextField!
    
    
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quantityTextField.delegate = self;
        
        ImageViewOutlet.image = images;
        Label.text = names;
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Buy(_ sender: Any) {
        
        self.performSegue(withIdentifier: "secondSegue", sender: self)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondSegue" {
            let thirdViewController = segue.destination as! ThirdViewController;
            
            thirdViewController.quantity11 = Int(quantityTextField.text!)!
            thirdViewController.price11 = price
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Calculatr(_ sender: Any) {
        
        price = Int(quantityTextField.text!)!
        price = price * 60;
        TextViewForPrice.text = "\(price)\n"
    }
    

}

extension SecondViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        self.Calculatr(self)
        return true;
    }
}
