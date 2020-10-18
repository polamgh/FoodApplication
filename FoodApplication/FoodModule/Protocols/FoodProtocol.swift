//
//  FoodProtocol.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/26/1399 AP.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingFood()

}

protocol PresenterToViewProtocol: class{
    func showFood(foodArray:FoodBaseModel)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createFoodListModule(postsListRef: FoodBaseViewController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func loadFood()
}

protocol InteractorToPresenterProtocol: class {
    func foodFetchedSuccess(foodModelArray:FoodBaseModel)
    func foodFetchFailed()
}
