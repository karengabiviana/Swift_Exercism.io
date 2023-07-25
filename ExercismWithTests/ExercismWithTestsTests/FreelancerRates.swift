//
//  FreelancerRates.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 25/07/23.
//

import XCTest

//In this exercise you'll be writing code to help a freelancer communicate with a project manager by providing a few utilities to quickly calculate daily and monthly rates, optionally with a given discount.
//
//We first establish a few rules between the freelancer and the project manager:
//
//The daily rate is 8 times the hourly rate.
//A month has 22 billable days.
//The freelancer is offering a discount if the project manager chooses to let the freelancer bill per month, which can come in handy if there is a certain budget the project manager has to work with.
//
//Discounts are modeled as fractional numbers representing percentage, for example 25.0 (25%).

//Task 1 - Implement the function dailyRateFrom(hourlyRate:) to calculate the daily rate given an hourly rate:
func dailyRateFrom(hourlyRate: Int) -> Double{
    var hourly = hourlyRate
    if hourly < 0{
        hourly = 0
    }
    return Double(hourly * 8)
    //The returned daily rate should be a Double.
}
//Task 2 - Implement the function monthlyRateFrom(hourlyRate:withDiscount:) to calculate the monthly rate, and apply a discount:
func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let monthly = dailyRateFrom(hourlyRate: hourlyRate) * 22.0
    let discountLet = (0.01 * discount) * monthly
    return (monthly - discountLet).rounded()
    //The returned monthly rate should be returned as a Double rounded to the nearest whole number.
}
//Task 3 - Implement the function workdaysIn(budget:hourlyRate:withDiscount:), that takes a budget, a hourly rate, and a discount, and calculates how many days of work that covers. The returned number of days should be returned as a Double rounded down to the nearest integer.
func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
    (budget / (dailyRateFrom(hourlyRate: hourlyRate)*(1.0 - discount/100.0))).rounded()
}

final class FreelancerRates: XCTestCase {

//Task 1 Tests
    func testDailyRateFromComumCase() {
        XCTAssertEqual(dailyRateFrom(hourlyRate: 60), 480)
    }

    func testDailyRateFromNegativeCase() {
        XCTAssertEqual(dailyRateFrom(hourlyRate: -12), 0)
    }
//Task 2 Tests
    func testMonthlyRateFromComumCase() {
        XCTAssertEqual(monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5), 12129)
    }
    func testMonthlyRateFromNegativeCase() {
        XCTAssertEqual(monthlyRateFrom(hourlyRate: -10, withDiscount: 10.5), 0)
    }
//Task 3 Test
    func testWorkdaysInComumCase() {
        XCTAssertEqual(workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11.0), 35)
    }
    func testWorkdaysInZeroDiscountCase() {
        XCTAssertEqual(workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 0), 31 )
    }
}
