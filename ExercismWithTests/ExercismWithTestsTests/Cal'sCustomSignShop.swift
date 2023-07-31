//
//  Cal'sCustomSignShop.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 26/07/23.
//

import XCTest
//In this exercise you'll be writing code to help a sign company create custom messages for their signs.

//Task 1 - Define the following constant strings which will be used to create signs:
//birthday: This holds the value "Birthday"
//valentine: This holds the value "Valentine's Day"
//anniversary: This holds the string "Anniversary"
let birthday = "Birthday"
let valentine = "Valentine's Day"
let anniversary = "Anniversary"

//Task 2 - Define the following constant characters which will be used to create signs:
//space: This holds the value " " (a single space)
//exclamation: This holds the value "!"
let space = " "
let exclamation = "!"

//Task 3 - Implement the function buildSign(for: String, name: String) -> String. This function takes one of the three strings you defined in the first task as the for parameter and a String holding someone's name as the name parameter and uses concatenation as well as the characters defined in task #2 to build up a phrase for a sign.
func buildSign(for occasion: String, name: String) -> String {
    "Happy \(occasion) \(name)" + String(exclamation)
}

//Task 4 - Implement the function graduationFor(name: String, year: Int) -> String which takes a name as a string parameter and a year as a integer parameter and uses string interpolation to create a phrase for a sign that uses a newline to separate the two lines of the message.
func graduationFor(name: String, year: Int) -> String {
    "Congratulations \(name)" + String(exclamation) + "\nClass of \(year)"
}

//Task 5 - Implement the function costOf(sign: String) -> Int which takes a string that holds the contents of the sign and returns the cost to create the sign, which is 2 dollars for each character in the sign plus a base price of 20 dollars.
func costOf(sign: String) -> Int {
    20 + (sign.count * 2)
}

final class Cal_sCustomSignShop: XCTestCase {
//Task 1 Tests
    func testLetBirthday() {
        XCTAssertEqual(birthday, "Birthday")
    }

    func testLetValentine() {
        XCTAssertEqual(valentine, "Valentine's Day")
    }

    func testLetAnniversary() {
        XCTAssertEqual(anniversary, "Anniversary")
    }

//Task 2 Tests
    func testLetSpace() {
        XCTAssertEqual(space, " ")
    }

    func testLetExclamation() {
        XCTAssertEqual(exclamation, "!")
    }

//Task 3 Tests
    func testBuildSignBirthday() {
        XCTAssertEqual(buildSign(for: birthday, name: "Otto"), "Happy Birthday Otto!")
    }
    
    func testBuildSignValentine() {
        XCTAssertEqual(buildSign(for: valentine, name: "Taylor"), "Happy Valentine's Day Taylor!")
    }

    func testBuildSignAnnyversary() {
        XCTAssertEqual(buildSign(for: anniversary, name: "Valentina"), "Happy Anniversary Valentina!")
    }

//Task 4 Tests
    func testGraduationFor() {
        XCTAssertEqual(graduationFor(name: "Isabel", year: 1988), "Congratulations Isabel!\nClass of 1988")
    }
//Task 5 Tests
    func testCostOfSign() {
        XCTAssertEqual(costOf(sign: graduationFor(name: "Isabel", year: 1988)), 94)
    }
    func testCostOfSignEmpty() {
        XCTAssertEqual(costOf(sign: ""), 20)
    }
}
