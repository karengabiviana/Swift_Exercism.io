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
    let squareOfSum = 0
    let sumOfSquare = 0

    //square loop
        //using array positions
        //sum the number into let squareOfSum
        //square of the let
    //sum loop
        //using array positions
        //square of the number into let squareOfSum
        //sum  into let squareOfSum

    return squareOfSum - sumOfSquare
}

final class DifferenceOfSquaresTests: XCTestCase {
    func test1To10() {
        let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let outputExpected = 2640
        XCTAssertEqual(DifferenceOfSquares(naturalNumbers: input), outputExpected)
    }
}
