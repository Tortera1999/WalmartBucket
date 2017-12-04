//
//  secondViewController.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/8/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit
import SafariServices

class SecondViewController: UIViewController {
    var walmart: WalmartItem? = nil;
    var pricing: Double = 0.0;
    
    
    
    @IBOutlet weak var TextViewForPrice: UITextView!
    @IBOutlet weak var quantityTextField: UITextField!
    
    
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quantityTextField.delegate = self;
        
        ImageViewOutlet.image = walmart?.image!;
        self.title = walmart?.name
        let labelSize = Label.numberOfCharactersThatFitLabel()
        var nextIndex = walmart?.description.startIndex
        
        var stringIndex = 0
//        
//        while (stringIndex != labelSize) {
//            nextIndex = walmart?.description.index(nextIndex!, offsetBy: 1)
//            stringIndex = (walmart?.description.indexDistance(of: (walmart?.description[nextIndex!])!))!
//        }
//        for _ in 0..<labelSize {
//        }
        Label.text = walmart?.description;
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Buy(_ sender: Any) {
        self.Calculater(sender)
        self.performSegue(withIdentifier: "secondSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondSegue" {
            let thirdViewController = segue.destination as! ThirdViewController;
            thirdViewController.quantity11 = Int(quantityTextField.text!)!
            thirdViewController.price11 = (pricing)
            thirdViewController.product = walmart
//            thirdViewController.productname = Label.text!
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Calculater(_ sender: Any) {
        pricing = Double(quantityTextField.text!)! * (walmart?.price)!
        TextViewForPrice.text = "\(pricing)\n"
    }
    @IBAction func OpenUrl(_ sender: Any) {
        let url = walmart?.itemUrl!
        let svc = SFSafariViewController(url: url!)
        self.present(svc, animated: true, completion: nil)
    }
    

}

extension SecondViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        self.Calculater(self)
        return true;
    }
}
