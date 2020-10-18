//
//  FoodBaseModel.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/26/1399 AP.
//

import Foundation
import ObjectMapper

class FoodBaseModel: Mappable {
    var foodtype: [FoodTypeModel]?
    var food: [FoodModel]?
    
    init() {
        
    }
    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        foodtype    <- map["foodtype"]
        food         <- map["food"]
    }
}


class FoodTypeModel: Mappable {
    var name: String?
    var id: Int?
    

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        name    <- map["name"]
        id         <- map["id"]
    }
}


class FoodModel: Mappable {
    var name: String?
    var imageName: String?
    var ingredients: String?
    var size: String?
    var amount: Int?
    var foodtype: Int?
    

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        name        <- map["name"]
        imageName   <- map["imageName"]
        ingredients <- map["ingredients"]
        size        <- map["size"]
        amount      <- map["amount"]
        foodtype    <- map["foodtype"]
    }
}
