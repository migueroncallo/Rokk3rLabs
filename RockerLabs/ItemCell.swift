//
//  ItemCell.swift
//  RockerLabs
//
//  Created by Miguel Roncallo on 2/25/17.
//  Copyright © 2017 RockerLabs. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var stockLabel: UILabel!
//    var product: Product!
    @IBOutlet var addToCartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(_ product: Product){
        self.productNameLabel.text = product.name!
        self.priceLabel.text = "$\(product.price!)"
        self.stockLabel.text = "x \(product.stock!)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
