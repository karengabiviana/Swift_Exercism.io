//
//  VexingVehiclePurchase.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 01/08/23.
//

import XCTest
//In this exercise you're going to write some code to help you prepare to buy a new vehicle.
//
//You have three tasks, one to help you determine the price of the vehicle you can afford, one to determine what kind of license you will need to get, and one to help you compute your yearly registration fees.

//Task 1 - The auto dealers in your town are all running a five year, 0% interest promotion that you would like to take advantage of. Implement the canIBuy(vehicle:price:monthlyBudget:) function that takes the name of the vehicle you are looking at, the price of the car, and your monthly budget and returns a string letting you know whether you can afford the car or not, if the monthly payment is within 10% above your monthly budget you will want to return a special reminder to be frugal:
func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    var answer = ""

    if price / 60 < monthlyBudget {
        answer = "Yes! I'm getting a \(vehicle)"
    } else if price / 60 < monthlyBudget * 1.1 {
        answer = "I'll have to be frugal if I want a \(vehicle)"
    } else {
        answer = "Darn! No \(vehicle) for me"
    }


 return answer
}

final class VexingVehiclePurchase: XCTestCase {
//Task 1 Tests
    func testCanIBuyYes() {
        XCTAssertEqual(canIBuy(vehicle: "1974 Ford Pinto", price: 516.32, monthlyBudget: 100.00), "Yes! I'm getting a 1974 Ford Pinto")
    }
    func testCanIBuyNo() {
        XCTAssertEqual(canIBuy(vehicle: "2011 Bugatti Veyron", price: 2_250_880.00, monthlyBudget: 10_000.00), "Darn! No 2011 Bugatti Veyron for me")
    }
    func testCanIBuyMaybe() {
        XCTAssertEqual(canIBuy(vehicle: "2020 Indian FTR 1200", price: 12_500, monthlyBudget: 200), "I'll have to be frugal if I want a 2020 Indian FTR 1200")
    }
}
