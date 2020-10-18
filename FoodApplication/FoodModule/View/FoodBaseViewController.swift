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
    var presentor:ViewToPresenterProtocol?
    var foodArrayList:FoodBaseModel = FoodBaseModel()
    var pageMenu : CAPSPageMenu?
    var items = Array<FoodBaseModel>()
    var foods = [FoodModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FoodRouter.createFoodListModule(postsListRef: self)
        presentor?.startFetchingFood()
        showProgressIndicator(view: self.view)
        
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
        btnFab.addTarget(self, action: #selector(btnShop(_:)), for: .touchUpInside)
    }
    
    func initPageMenu(controllerArray : [UIViewController]) {
        let parameters: [CAPSPageMenuOption] = [
            .menuItemWidth(self.view.frame.width / 3 - 20),
            .viewBackgroundColor(UIColor.systemBackground),
            .selectedMenuItemLabelColor(UIColor.darkGray),
            .unselectedMenuItemLabelColor(UIColor.lightGray),
            .scrollMenuBackgroundColor(UIColor.systemBackground),
            .selectionIndicatorColor(UIColor.systemBackground),
            .bottomMenuHairlineColor(UIColor.systemBackground),
            .menuItemFont(UIFont.boldSystemFont(ofSize: 32)),
        ]

        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0, y: 68, width: self.view.frame.width, height: self.view.frame.height - 65), pageMenuOptions: parameters)
        self.view.addSubview(pageMenu!.view)
    }

        @objc func btnShop(_ sender : UIButton){
            let story = UIStoryboard(name: "OrderStoryboard", bundle: nil)
            let vc = story.instantiateViewController(withIdentifier: "Orders")
            vc.isModalInPresentation = true
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
}




extension FoodBaseViewController:PresenterToViewProtocol{
    
    func showFood(foodArray: FoodBaseModel) {

        self.foodArrayList = foodArray
        
        var controllerArray : [UIViewController] = []

        guard let foodTypes = foodArray.foodtype else {
            return
        }
        guard let foodAllType = foodArray.food else {
            return
        }
        
        for type in foodTypes {
            let story = UIStoryboard(name: "FoodStoryBoard", bundle: nil)
            guard let controller = story.instantiateViewController(withIdentifier: "FoodListViewController") as? FoodListViewController else{return}
            for food in foodAllType {
                if food.foodtype == type.id{
                    self.foods.append(food)
                }
            }
            controller.itemsFromSource = self.foods
            controller.title = type.name
            controllerArray.append(controller)
            self.foods.removeAll()
        }
        
        
        
        initPageMenu(controllerArray : controllerArray)
        hideProgressIndicator(view: self.view)
        initShoppButton()
    }
    
    func showError() {

        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
