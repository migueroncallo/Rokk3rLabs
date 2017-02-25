//
//  CartCell.swift
//  RockerLabs
//
//  Created by Miguel Roncallo on 2/25/17.
//  Copyright © 2017 RockerLabs. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet var productNameLabel: UILabel!

    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var deleteButton: UIButton!
    
    @IBOutlet var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(_ product: Product){
        self.productNameLabel.text = product.name!
        self.priceLabel.text = "$\(product.price!)"
        self.amountLabel.text = "x \(product.stock!)"
    }
}
