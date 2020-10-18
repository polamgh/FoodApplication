//
//  FoodPresenter.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/26/1399 AP.
//

import Foundation
import UIKit

class FoodPresenter:ViewToPresenterProtocol {

    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingFood() {
        print("Presenting...")
        interactor?.loadFood()
    }
    

}

extension FoodPresenter: InteractorToPresenterProtocol{
    
    func foodFetchedSuccess(foodModelArray: FoodBaseModel) {
        view?.showFood(foodArray: foodModelArray)
    }
    
    func foodFetchFailed() {
        view?.showError()
    }
    
}
