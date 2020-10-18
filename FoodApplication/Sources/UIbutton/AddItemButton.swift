//
//  AddItemButton.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/24/1399 AP.
//

import UIKit

class AddItemButton: UIButton {

    var counter = true
    var temp = ""
    override open var isHighlighted: Bool {
        didSet {
            self.backgroundColor = self.isHighlighted ?  UIColor.black : #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            if counter{
                temp = self.title(for: .normal) ?? ""
                counter = false
            }
            self.setTitle("Added +1", for: .normal)
            DispatchQueue.main.asyncAfter(wallDeadline: DispatchWallTime.now() + 0.5, execute: {
                self.backgroundColor = self.isHighlighted ?  #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) : UIColor.black
                self.setTitle(self.temp, for: .normal)
            })
        }
    }
    
    

}


@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
