//
//  Services.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/26/1399 AP.
//

import Foundation
import Moya


enum Services {
    case getFoodList
}

extension Services : TargetType{
    
    var baseURL: URL {
        return URL(string: "http://localhost:8080")!
    }
    
    var path: String {
        switch self {
        case .getFoodList:
            return "/getfood"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFoodList:
          return .get
        }
    }
    
    var sampleData: Data {
        if let path = Bundle.main.path(forResource: "FoodResponse", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    if self == .getFoodList {
                        return data
                    }
              } catch {
                   // handle error
              }
        }
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getFoodList :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getFoodList:
            return ["Content-Type":"application/json"]
        }
    }
    
    
    
    
}
