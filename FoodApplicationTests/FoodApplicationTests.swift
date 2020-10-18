//
//  FoodApplicationTests.swift
//  FoodApplicationTests
//
//  Created by Ali Ghanavati on 7/27/1399 AP.
//

import XCTest
@testable import FoodApplication
import Moya

class FoodApplicationTests: XCTestCase {
    var presentor:ViewToPresenterProtocol?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testGetFoodList(){
        FoodRouter.createFoodListModule(postsListRef: FoodBaseViewController())
        presentor?.startFetchingFood()
    }

}


extension FoodApplicationTests:PresenterToViewProtocol{
    func showError() {
        print("Error in get data from server")
    }
    
    
    func showFood(foodArray: FoodBaseModel) {
        print(foodArray.food)
    }

}
