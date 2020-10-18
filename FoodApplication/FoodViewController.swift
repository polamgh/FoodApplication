//
//  FoodViewController.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/24/1399 AP.
//

import UIKit

let btnFab = UIButton()
var badge : BadgeController?
class FoodBaseViewController: UIViewController {

   
    var pageMenu : CAPSPageMenu?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []

        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        let story2 = UIStoryboard(name: "Main", bundle: nil)
        let controller = story2.instantiateViewController(withIdentifier: "PizzaViewController")
        let story3 = UIStoryboard(name: "Main", bundle: nil)
        let controller3 = story3.instantiateViewController(withIdentifier: "PizzaViewController")
        
        let story4 = UIStoryboard(name: "Main", bundle: nil)
        let controller4 = story4.instantiateViewController(withIdentifier: "PizzaViewController")
        let story5 = UIStoryboard(name: "Main", bundle: nil)
        let controller5 = story5.instantiateViewController(withIdentifier: "PizzaViewController")
        let story6 = UIStoryboard(name: "Main", bundle: nil)
        let controller6 = story6.instantiateViewController(withIdentifier: "PizzaViewController")
        controller.title = "Pizza"
        controller3.title = "Sushi"
        controller4.title = "Drinks"
        controller5.title = "Pizza"
        controller6.title = "Sushi"
        controllerArray.append(controller)
        controllerArray.append(controller3)
        controllerArray.append(controller4)
        controllerArray.append(controller5)
        controllerArray.append(controller6)

        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        var parameters: [CAPSPageMenuOption] = [
            .menuItemWidth(self.view.frame.width / 3 - 20),
            .viewBackgroundColor(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)),
            .selectedMenuItemLabelColor(UIColor.darkGray),
            .unselectedMenuItemLabelColor(UIColor.lightGray),
            .menuItemSeparatorColor(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)),
            .scrollMenuBackgroundColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),
            .menuItemFont(UIFont.boldSystemFont(ofSize: 32)),
        ]

        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0, y: 68, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)

        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
        initShoppButton()

    }

    
    fileprivate func initShoppButton() {
        btnFab.frame = CGRect(x: self.view.frame.maxX - 80 , y: self.view.frame.maxY - 110, width: 60, height: 60)
        btnFab.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnFab.layer.cornerRadius = 30
        btnFab.layer.borderWidth = 0.2
        btnFab.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        btnFab.setImage(#imageLiteral(resourceName: "shopIcon"), for: .normal)
        self.view.addSubview(btnFab)
        
        
        badge = BadgeController(for: btnFab)
        badge?.badgeTextFont = UIFont.systemFont(ofSize: 15)
        badge?.badgeBackgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        badge?.badgeTextColor = UIColor.white
        badge?.badgeHeight = 20
        badge?.centerPosition = .custom(x: 50, y: 10)
    }

    
    
 
}




