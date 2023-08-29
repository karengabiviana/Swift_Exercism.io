//
//  Double-Null0111-ClosuresAreForever.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 25/08/23.
//

import XCTest
//Hello again, Agent Double-Null0111.

//The forces of UMBRA are acting up again, and it is up to you to foil their latest scheme. Our intel branch informs us that those Minions are planning to set off a stink-bomb at the Governor's ball.
//
//Since the minions are so clumsy, they often accidentally arm the stink-bombs in their labs and offices. And because they keep forgetting how to disarm their stink-bombs, they have implemented a system generate the disarming instructions that list the order the wires must be cut from the bomb's ID number.
//
//Your job is to write the code that will allow you to disarm the stink-bomb at the ball before it goes off.


//Task 1 - There are three differently colored wires on each stink-bomb. Write a closure that takes a (String, String, String) tuple and returns the tuple with the order of the first two elements flipped. Assign this closure to the name flip.
let flip: (String, String, String) -> (String, String, String) =
{(s1:String, s2:String, s3:String) -> (String, String, String) in
        return (s2, s1, s3)
    }
//Task 2 - Write a closure that takes a (String, String, String) tuple and returns the tuple with the order of the wires rotated to the left. Assign this closure to the name rotate.
let rotate: (String, String, String) -> (String, String, String) =
{(s1:String, s2:String, s3:String) -> (String, String, String) in
    return (s2, s3, s1)
}

final class DoubleNull0111ClosuresAreForeverTests: XCTestCase {
    //Task 1 tests
    func testFlip() {
        let output = flip("red", "yellow", "blue")
        let outputExpected = ("yellow", "red", "blue")

        XCTAssertTrue(output == outputExpected)
    }
    //Task 2 tests
    func testRotate() {
        let output = rotate("red", "yellow", "blue")
        let outputExpected = ("yellow", "blue", "red")

        XCTAssertTrue(output == outputExpected)
    }

}
