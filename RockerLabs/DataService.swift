//
//  DataService.swift
//  RockerLabs
//
//  Created by Miguel Roncallo on 2/25/17.
//  Copyright © 2017 RockerLabs. All rights reserved.
//

import Foundation

class DataService{
    static let sharedInstance = DataService()
    
    var products = [Product]()
    var shoppingCart = [Product]()
    var total = 0.0
    
    func initProducts(){
        
        products.append(Product("Cereal", 4.19, 5))
        products.append(Product("Milk", 2.59, 3))
        products.append(Product("Banana", 1.29, 10))
        products.append(Product("Broccoli", 1.99, 7))
        products.append(Product("Potatoes", 1.99, 4))
        products.append(Product("Cheddar Cheese", 5.29, 5))
        products.append(Product("Tofu", 4.19, 2))
        products.append(Product("Mint Tea", 3.99, 6))
        products.append(Product("Dishwasher", 5.39, 4))
        products.append(Product("Toilet Paper", 4.59, 5))
        products.append(Product("Chocolate Bar", 2.79, 3))
        products.append(Product("Canned Black Beans", 1.79, 6))
        products.append(Product("Eggs", 2.99, 7))
        products.append(Product("Ground Beef", 4.99, 12))
        products.append(Product("Coffee", 10.99, 3))
        products.append(Product("Apples", 1.79, 8))
        products.append(Product("Yogurt", 0.83, 7))
        products.append(Product("Chicken", 11.49, 10))
        products.append(Product("Ketchup", 0.53, 4))
        products.append(Product("Mustard", 1.23, 6))
    }
    
    func addToCart(_ productToAdd: Product, _ position: Int){
        
        var found = false
        if shoppingCart.count > 0{
            
            for p in shoppingCart{
                
                if p.name == productToAdd.name{
                    
                    p.stock = p.stock + 1
                    found = true
                }
            }
            
            if !found{
                let p = Product(productToAdd.name, productToAdd.price, 1)
                self.shoppingCart.append(p)

            }
        }else{
            
            let p = Product(productToAdd.name, productToAdd.price, 1)
            self.shoppingCart.append(p)
            
        }
        
        for p in self.products{
            if p === productToAdd{
                productToAdd.stock = productToAdd.stock - 1
            }
        }
        
        if productToAdd.stock < 1{
            self.products.remove(at: position)
        }
    }
    
    func removeFromCart(_ productToRemove: Product, _ position: Int){
        var found = false
        for p in shoppingCart{
            if p === productToRemove{
                p.stock = p.stock - 1
            }
        }
        
        for p in products{
            if p.name == productToRemove.name{
                p.stock = p.stock + 1
                found = true
            }
        }
        
        if !found{
            let p = Product(productToRemove.name, productToRemove.price, 1)
            self.products.append(p)
        }
        
        if productToRemove.stock < 1{
            self.shoppingCart.remove(at: position)
        }
    }
    
    func calculateTotal() -> Double{
        self.total = 0.0
        for p in self.shoppingCart{
            total += (p.price * Double(p.stock))
        }
        
        return total
    }
}
