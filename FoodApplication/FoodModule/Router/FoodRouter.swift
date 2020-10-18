//
//  FoodRouter.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/26/1399 AP.
//

import Foundation
import UIKit

class FoodRouter:PresenterToRouterProtocol{
    static func createFoodListModule(postsListRef foodListRef: FoodBaseViewController) {
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = FoodPresenter()
               
        foodListRef.presentor = presenter
        foodListRef.presentor?.router = FoodRouter()
        foodListRef.presentor?.view = foodListRef
        foodListRef.presentor?.interactor = FoodInteractor()
        foodListRef.presentor?.interactor?.presenter = presenter
    }
    

    
    static var mainstoryboard: UIStoryboard{
            return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
  
    
}
