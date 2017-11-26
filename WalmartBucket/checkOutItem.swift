//
//  checkOutItem.swift
//  WalmartBucket
//
//  Created by Nikhil Iyer on 11/26/17.
//  Copyright © 2017 Nikhil Iyer. All rights reserved.
//

import Foundation

class checkOutItem {
    let walmartItem: WalmartItem
    let price: Double
    let quantity: Int
    
    init(walmartItem: WalmartItem, price: Double, quantity: Int) {
        self.walmartItem = walmartItem;
        self.price = price;
        self.quantity = quantity;
    }
    
    
}
