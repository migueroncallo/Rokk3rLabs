//
//  ViewController.swift
//  RockerLabs
//
//  Created by Miguel Roncallo on 2/25/17.
//  Copyright © 2017 RockerLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var totalItemsLabel: UILabel!
    
    @IBOutlet var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.openCart(_:)))
        
        self.totalItemsLabel.addGestureRecognizer(tap)
        self.totalItemsLabel.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    //Supporting functions
    
    func addToCart(_ sender: UIButton){
       
        DataService.sharedInstance.addToCart(DataService.sharedInstance.products[sender.tag], sender.tag)
        self.tableView.reloadData()
        self.totalPriceLabel.text = "Total Price $\(DataService.sharedInstance.calculateTotal())"
        self.totalItemsLabel.text = "Total items x \(DataService.sharedInstance.shoppingCart.count)"
    }

    func openCart(_ sender: UIGestureRecognizer){
//        Cart VC
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "Cart VC") as! CartController
        modalVC.modalPresentationStyle = .currentContext
        self.present(modalVC, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.sharedInstance.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item Cell") as! ItemCell
        
//        cell.product = DataService.sharedInstance.products[indexPath.row]
        cell.addToCartButton.tag = indexPath.row
        cell.addToCartButton.addTarget(self, action: #selector(self.addToCart(_:)), for: .touchUpInside)
        cell.config(DataService.sharedInstance.products[indexPath.row])
        
        return cell
    }
}

