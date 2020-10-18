//
//  FoodInteractor.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/26/1399 AP.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift


class FoodInteractor: PresenterToInteractorProtocol{
    
    var presenter: InteractorToPresenterProtocol?
    let bag = DisposeBag()
    
    func loadFood() {
        
       
            FoodService
                .getFood()
                .subscribe (onSuccess: {  (foodBaseModel , error) in
                    self.presenter?.foodFetchedSuccess(foodModelArray: foodBaseModel!)
                }) { (error) in
                    self.presenter?.foodFetchFailed()
                }.disposed(by: bag)
       
    }
    
}
