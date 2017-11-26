//
//  secondViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/8/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var walmart: WalmartItem? = nil;
    var pricing: Double = 0.0;
    var images = UIImage();
    
    
    
    @IBOutlet weak var TextViewForPrice: UITextView!
    @IBOutlet weak var quantityTextField: UITextField!
    
    
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quantityTextField.delegate = self;
        
        ImageViewOutlet.image = walmart?.image!;
        Label.text = walmart?.name;
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Buy(_ sender: Any) {
        
        self.performSegue(withIdentifier: "secondSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondSegue" {
            let thirdViewController = segue.destination as! ThirdViewController;
            thirdViewController.quantity11 = Int(quantityTextField.text!)!
            thirdViewController.price11 = (pricing)
            thirdViewController.productname = Label.text!
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Calculatr(_ sender: Any) {
        pricing = Double(quantityTextField.text!)! * (walmart?.price)!
        TextViewForPrice.text = "\(pricing)\n"
    }
    

}

extension SecondViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        self.Calculatr(self)
        return true;
    }
}
