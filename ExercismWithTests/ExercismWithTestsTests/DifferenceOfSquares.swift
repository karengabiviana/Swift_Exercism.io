//
//  DifferenceOfSquares.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 03/10/23.
//

import XCTest

//Find the difference between the square of the sum and the sum of the squares of the first N natural numbers.
//
//The square of the sum of the first ten natural numbers is (1 + 2 + ... + 10)² = 55² = 3025.
//
//The sum of the squares of the first ten natural numbers is 1² + 2² + ... + 10² = 385.
//
//Hence the difference between the square of the sum of the first ten natural numbers and the sum of the squares of the first ten natural numbers is 3025 - 385 = 2640.
//
//You are not expected to discover an efficient solution to this yourself from first principles; research is allowed, indeed, encouraged. Finding the best algorithm for the problem is a key skill in software engineering.
func DifferenceOfSquares(naturalNumbers: [Int]) -> Int {
    var squareOfSum = 0
    var sumOfSquare = 0

    for numbers in naturalNumbers {
        var naturalVerificatedNumber = numbers
        if naturalVerificatedNumber < 0 {
            naturalVerificatedNumber = 0
        }
        squareOfSum += naturalVerificatedNumber
    }
    squareOfSum *= squareOfSum

    for numbers in naturalNumbers {
        var naturaVerificatedNumber = numbers
        if naturaVerificatedNumber < 0 {
            naturaVerificatedNumber = 0
        }
        sumOfSquare += naturaVerificatedNumber * naturaVerificatedNumber
    }

    return squareOfSum - sumOfSquare
}

final class DifferenceOfSquaresTests: XCTestCase {
    func test1To10() {
        let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let outputExpected = 2640
        XCTAssertEqual(DifferenceOfSquares(naturalNumbers: input), outputExpected)
    }

    func testOneNumber() {
        let input = [3]
        let outputExpected = 0
        XCTAssertEqual(DifferenceOfSquares(naturalNumbers: input), outputExpected)
    }

    func testALotOfNumbers() {
        let input = Array(1...50)
        let outputExpected = 1_582_700
        XCTAssertEqual(DifferenceOfSquares(naturalNumbers: input), outputExpected)
    }

    func testWithZero() {
        let input = [0]
        let outputExpected = 0
        XCTAssertEqual(DifferenceOfSquares(naturalNumbers: input), outputExpected)
    }

    func testWithNegative() {
        let input = [-1,1,2]
        let outputExpected = 4
        XCTAssertEqual(DifferenceOfSquares(naturalNumbers: input), outputExpected)
    }

    func testNoSequence() {
        let input = [3,9,2]
        let outputExpected = 102
        XCTAssertEqual(DifferenceOfSquares(naturalNumbers: input), outputExpected)
    }
}
