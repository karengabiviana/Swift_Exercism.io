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
//Task 3 - In order to figure out the order in which to cut the stink-bomb wires, you will need to implement a function that generates the proper shuffling function based on the ID number of the stink-bomb.

//Implement the function:
//
//makeShuffle(
//  flipper: @escaping ((String, String, String)) -> (String, String, String),
//  rotator: @escaping ((String, String, String)) -> (String, String, String)
//) -> (UInt8, (String, String, String)) -> (String, String, String)
//which takes as input a closure that flips two wires and a closure that rotates the three wires and returns a closure. This returned closure takes the ID number of the stink-bomb and the order of the three wires, and then computes the order the wires need to be cut. This is computed as follows:
//
//For each bit in the ID number, starting with the rightmost bit, you will apply the flipper closure to the wires tuple if the bit is a 0 and you will apply the rotator closure if it is a 1 giving the new state of the wires. After the appropriate closures have been applied for all eight bits of the ID, the final state of the wires is the order they need to be cut in.
func makeShuffle(
    flipper: @escaping ((String, String, String)) -> (String, String, String),
    rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> (UInt8, (String, String, String)) -> (String, String, String) {
    var newWires = { (id: UInt8, wires: (String, String, String)) -> (String, String, String) in

        var changedWires = wires

        for i in 0..<8 {
            let bit = (id >> i) & 1
            if bit == 0 {
                changedWires = flipper(changedWires)
            } else {
                changedWires = rotator(changedWires)
            }
        }
        return changedWires
    }
    return newWires
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
    //Task 3 tests
    func testMakeShuffle1() {
        let wires = ("Red", "Yellow", "Black")
        let shuffle = makeShuffle(flipper: flip, rotator: rotate)
        let expected = ("Yellow", "Black", "Red")
        let got = shuffle(113, wires)
        XCTAssertTrue(got == expected)
    }

    func testMakeShuffle2() {
        let wires = ("Purple", "Cyan", "Marigold")
        let shuffle = makeShuffle(flipper: flip, rotator: rotate)
        let expected = ("Marigold", "Cyan", "Purple")
        let got = shuffle(253, wires)
        XCTAssertTrue(got == expected)
    }
    func testMakeShuffle3() {
        let wires = ("Purple", "Cyan", "Marigold")
        let shuffle = makeShuffle(flipper: flip, rotator: rotate)
        let expected = ("Marigold", "Cyan", "Purple")
        let got = shuffle(253, wires)
        XCTAssertTrue(got == expected)
    }
}
