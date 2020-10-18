//
//  OrderEntity.swift
//  FoodApplication
//
//  Created by Ali Ghanavati on 7/27/1399 AP.
//

import Foundation
class OrderEntity{
    
    static let shared = OrderEntity()
    private var orderItemes = Array<FoodModel>()
    private init(){}
    
    func addToOrderItems(foodModel : FoodModel)  {
        self.orderItemes.append(foodModel)
    }
    
    func getOrderItems() -> Array<FoodModel> {
        return orderItemes
    }
    
    func getOrederTotalAmounts() -> Int {
        var totalAmount = 0
        for item in self.orderItemes {
            totalAmount = totalAmount + (item.amount ?? 0)
        }
        return totalAmount
    }
    
    func deleteOrderItem(index : Int) -> Array<FoodModel>{
        self.orderItemes.remove(at: index)
        return self.orderItemes
    }
    
}
