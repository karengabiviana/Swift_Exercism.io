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
    struct Leap {
        let divisibleBy4 = true
        let divisibleBy100 = false
        let divisibleBy400 = true
    }

    func isLeap(year: Date) -> Bool {
        true
    }
}

class LeapTests: XCTestCase {
    func testIsLeap() {
        //Arrange
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let inputYearString = "2024"
        let inputYear = dateFormatter.date(from: inputYearString)

        //Act


        //Assert


    }
func testIsNoLeap() {
        //Arrange
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let inputYearString = "2023"
        let inputYear = dateFormatter.date(from: inputYearString)

        //Act

        //Assert

    }
}
