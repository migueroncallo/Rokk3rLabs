//
//  CartController.swift
//  RockerLabs
//
//  Created by Miguel Roncallo on 2/25/17.
//  Copyright © 2017 RockerLabs. All rights reserved.
//

import UIKit

class CartController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var totalPriceLabel: UILabel!
    
    @IBOutlet var totalItemsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        self.totalItemsLabel.text = "Total Items x \(DataService.sharedInstance.shoppingCart.count)"
        
        self.totalPriceLabel.text = "Total Price $\(DataService.sharedInstance.calculateTotal())"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Button Actions
    
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    //Supporting functions
    
    func removeFromCart(_ sender: UIButton){
        DataService.sharedInstance.removeFromCart(DataService.sharedInstance.shoppingCart[sender.tag], sender.tag)
        self.tableView.reloadData()
        self.totalPriceLabel.text = "Total Price $\(DataService.sharedInstance.calculateTotal())"
        self.totalItemsLabel.text = "Total items x \(DataService.sharedInstance.shoppingCart.count)"
    }
}

extension CartController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.sharedInstance.shoppingCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cart Cell") as! CartCell
        
        cell.deleteButton.tag = indexPath.row
        cell.config(DataService.sharedInstance.shoppingCart[indexPath.row])
        cell.deleteButton.addTarget(self, action: #selector(self.removeFromCart(_:)), for: .touchUpInside)
        
        return cell
    }
}
