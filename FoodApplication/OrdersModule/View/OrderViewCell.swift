//
//  OrderViewCell.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/27/1399 AP.
//

import UIKit

class OrderViewCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
