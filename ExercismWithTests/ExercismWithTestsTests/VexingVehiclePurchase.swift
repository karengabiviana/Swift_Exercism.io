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
//Task2 - Implement the licenseType(numberOfWheels:) function that takes the number of wheels on your new vehicle and returns the type of license you will need. Vehicles with 2 or 3 wheels will require a motorcycle license, vehicles with 4 or 6 wheels will require an automobile license, vehicles with 18 wheels require a commercial trucking license, and any other number of wheels returning an failure message:
func licenseType(numberOfWheels wheels: Int) -> String {
    var answer = ""

    switch wheels {
    case 2, 3 :
        answer = "You will need a motorcycle license for your vehicle"
    case 4, 6 :
        answer = "You will need an automobile license for your vehicle"
    case 18 :
        answer = "You will need a commercial trucking license for your vehicle"
    default:
        answer = "We do not issue licenses for those types of vehicles"
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
//Task 2 Tests
    func testLicenseTypeMotorcycle() {
        XCTAssertEqual(licenseType(numberOfWheels: 2), "You will need a motorcycle license for your vehicle")
    }
    func testLicenseTypeAutomobile() {
        XCTAssertEqual(licenseType(numberOfWheels: 6), "You will need an automobile license for your vehicle")
    }
    func testLicenseTypeTrucking() {
        XCTAssertEqual(licenseType(numberOfWheels: 18), "You will need a commercial trucking license for your vehicle")
    }
    func testLicenseTypeNotLicense() {
        XCTAssertEqual(licenseType(numberOfWheels: 0), "We do not issue licenses for those types of vehicles")
    }
}
