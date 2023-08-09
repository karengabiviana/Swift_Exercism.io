//
//  MasterMixologist.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 09/08/23.
//

import XCTest

//You are a master mixologist, making tasty drinks for the public to enjoy on their nights out. But you figured that you could make your life easier by writing a bit of code to help you with your job.

//Task 1 - Different drinks take different amount of time to prepare: "beer", "soda", and "water" take 0.5 minutes each, "shot"s take 1.0 minutes, "mixed drink"s take 1.5 minutes, "fancy drink"s take 2.5 minutes and "frozen drink"s take 3.0 minutes.

//Implement the function timeToPrepare(drinks: [String]) -> Double which takes a non-empty array of drinks and returns the total time required to make the order.
func timeToPrepare(drinks: [String]) -> Double{
    var time = 0.0
        for drink in drinks {
            switch drink {
            case "beer", "soda", "water":
                time += 0.5
            case "shot" :
                time += 1.0
            case "mixed drink":
                time += 1.5
            case "fancy drink":
                time += 2.5
            case "frozen drink":
                time += 3.0
            default:
                time += 0.0
        }
      }
        return time
}

final class MasterMixologist: XCTestCase {
    //Task 1 tests
    func testTimeToPrepare() {
        XCTAssertEqual(timeToPrepare(drinks: ["beer", "frozen drink", "shot"]), 4.5)
    }
    func testTimeToPrepareEmptyArray() {
        XCTAssertEqual(timeToPrepare(drinks: []), 0.0)
    }
    func testTimeToPrepareToMuchWork() {
        XCTAssertEqual(timeToPrepare(drinks: ["beer", "frozen drink", "shot", "mixed drink", "frozen drink", "soda", "fancy drink", "water","beer", "frozen drink", "shot", "mixed drink", "frozen drink", "soda", "fancy drink", "water"]), 25)
    }

}
