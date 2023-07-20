//
//  LayersOfLasagna.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 20/07/23.
//

import XCTest
let expectedMinuteInOven = 40

func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    expectedMinuteInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: Int) -> Int {
    layers * 2
}

func totalTimeInMinutes(layers:Int, elapsedMinutes: Int) -> Int {
    preparationTimeInMinutes(layers: layers) + elapsedMinutes
}

final class LayersOfLasagnaTests: XCTestCase {
    func testExpectedMinutedInOven() {
        XCTAssertEqual(expectedMinuteInOven, 40)
    }

    func testRemainMinutesInOven() {
        XCTAssertEqual(remainingMinutesInOven(elapsedMinutes:30), 10)
    }

    func testRemainMinutesInOvenNegative() {
        XCTAssertEqual(remainingMinutesInOven(elapsedMinutes:60), -20)
    }

    func testpreparationTimeInMinutes() {
        XCTAssertEqual(preparationTimeInMinutes( layers: 2), 4)
    }

    func testTotalTimeInMinutes() {
        XCTAssertEqual(totalTimeInMinutes(layers: 3, elapsedMinutes: 20), 26)
    }

}
