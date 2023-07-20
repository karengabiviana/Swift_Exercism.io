//
//  ExercismWithTestsTests.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 20/07/23.
//

import XCTest
@testable import ExercismWithTests

func hello() -> String {
    "Hello, World!"
}

final class ExercismWithTestsTests: XCTestCase {

    func testHelloWorld() {
        XCTAssertEqual(hello(), "Hello, World!")
    }

}
