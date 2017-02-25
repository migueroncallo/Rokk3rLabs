//
//  Product.swift
//  RockerLabs
//
//  Created by Miguel Roncallo on 2/25/17.
//  Copyright © 2017 RockerLabs. All rights reserved.
//

import Foundation

class Product{
    var name: String!
    var price: Double!
    var stock: Int!
    
    required init(_ name: String, _ price: Double, _ stock: Int) {
        self.name = name
        self.price = price
        self.stock = stock
    }
}
