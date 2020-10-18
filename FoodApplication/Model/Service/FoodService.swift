//
//  FoodService.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/26/1399 AP.
//

import Foundation
import Alamofire
import ObjectMapper
import Moya
import RxSwift

class FoodService {
    static let serviceProvider = MoyaProvider<Services>()
    
    static func getFood() -> Single<(FoodBaseModel?, Error?)> {
        if buidEnum == .onlineService{
            return Single<(FoodBaseModel?, Error?)>.create { (single) -> Disposable in
                serviceProvider.request(.getFoodList) { (result) in
                    switch result {
                    case .success(let value):
                        if let data = value.data as? Data {
                            guard let JSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else{
                                single(.error(FoodError.invalidError("Error in Parsing message")))
                                return
                            }
                            let arrayObject = Mapper<FoodBaseModel>().map(JSON: JSON)
                            single(.success((FoodBaseModel : arrayObject, Error: nil)))
                        }
                    case .failure(let error):
                        single(.error(FoodError.invalidError(error.errorDescription ?? "")))
                    }
                }
                return Disposables.create {}
            }
        }else {
            
            return Single<(FoodBaseModel?, Error?)>.create { (single) -> Disposable in
                let arrayObject = Mapper<FoodBaseModel>().map(JSONfile: "FoodResponse.json")
                single(.success((FoodBaseModel : arrayObject, Error: nil)))
                return Disposables.create {}
            }
        }
    }
}
