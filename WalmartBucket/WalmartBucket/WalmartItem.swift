//
//  WalmartItem.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/22/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import UIKit

class WalmartItem{
    let name: String;
    let price: Double;
    let addToCartUrl: URL?;
    let itemUrl: URL?;
    var image: UIImage?;
    let description: String;
    let imageURL: String
    
    
    init(name: String, price: Double, description: String, imageURL: String, addToCartURL: String, itemURL: String) {
        self.name = name
        self.price = price
        self.addToCartUrl = URL(string: addToCartURL)
        self.itemUrl = URL(string: itemURL)
        self.description = description
        self.imageURL = imageURL
        getImage()
    }
    
    private func getImage() {
        let url = URL(string: imageURL);
        do {
            let data1 = try Data(contentsOf: url!);
            let image = UIImage(data: data1)
            self.image = image!
            
        } catch {
            print("error when retriving image, check url")
            self.image = nil
        }
    }
    
}
