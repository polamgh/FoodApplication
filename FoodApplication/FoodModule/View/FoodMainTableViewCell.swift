//
//  FoodMainTableViewCell.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/24/1399 AP.
//

import UIKit

class FoodMainTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewFood: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtIngredients: UILabel!
    @IBOutlet weak var txtSize: UILabel!
    @IBOutlet weak var btnSelect: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

