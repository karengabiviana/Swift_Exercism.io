//
//  Leap.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 15/01/24.
//

import Foundation
import XCTest

//*Instructions*
//Given a year, report if it is a leap year.
//
//The tricky thing here is that a leap year in the Gregorian calendar occurs:
//on every year that is evenly divisible by 4
//  except every year that is evenly divisible by 100
//    unless the year is also evenly divisible by 400

//For example, 1997 is not a leap year, but 1996 is. 1900 is not a leap year, but 2000 is.

class Year {

    let calendarYear: Int

    init(calendarYear: Int) {
        self.calendarYear = calendarYear
    }


    func isLeap(year: Int) -> Bool {
        if year % 4 != 0 {
            return false
        } else if year % 100 != 0 {
            return true
        } else if year % 400 != 0 {
            return false
        } else {
            return true
        }
    }
}

class LeapTests: XCTestCase {
    func testIsLeap() {
        //Arrange
        let year = Year(calendarYear: <#Int#>)
        let input = 1996
        //Act
        let result = year.isLeap(year: input)
        //Assert
        XCTAssertTrue(result)
    }

    func testIsNoLeap() {
        //Arrange
        let year = Year(calendarYear: <#Int#>)
        let input = 1997
        //Act
        let result = year.isLeap(year: input)
        //Assert
        XCTAssertFalse(result)
    }

    func testIsNoLeapDivisibleBy100() {
        //Arrange
        let year = Year(calendarYear: <#Int#>)
        let input = 1900
        //Act
        let result = year.isLeap(year: input)
        //Assert
        XCTAssertFalse(result)
    }
    func testIsLeapDivisibleBy400() {
        //Arrange
        let year = Year(calendarYear: <#Int#>)
        let input = 2000
        //Act
        let result = year.isLeap(year: input)
        //Assert
        XCTAssertTrue(result)
    }
}
