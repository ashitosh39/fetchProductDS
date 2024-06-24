//
//  ProductTableViewCell.swift
//  fetchProductDS
//
//  Created by Macintosh on 31/05/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageViewLabel: UIImageView!
    
    @IBOutlet weak var idLabel: UILabel!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
