//
//  SliceSizing.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 09/08/23.
//

import XCTest
//You have a number of pizza slice shops in your town and you want to write a webapp that will let you compare two different pizza configurations to let you know who will give you the bigger slice.

//Task 1 - Implement the function, sliceSize(diameter: Double?, slices: Int?) -> Double?, which, given the diameter of a pizza and the number of slices per pizza returns the area of a slice. For negative diameters and for number of slices less than 1, return nil, as there is no such thing as a pizza with negative diameter and no way to slice a pizza into fewer than 1 slice. If either parameter is nil, also return nil
func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    guard let diameter = diameter, diameter >= 0 else { return nil }
        guard let slices = slices, slices > 2 else { return nil }
        let radius = diameter / 2
        let area = Double.pi * (radius * radius)
        return area / Double(slices)
}

//Task 2 - You web application will pass four strings to your function, biggestSlice(diameterA: String, slicesA: String, diameterB: String, slicesB: String) -> String. The first and second strings are the diameter and number of slices of the first pizza respectively, and the third and fourth are the diameter and number of slices of the second pizza respectively.

//Implement biggestSlice so that it attempts to convert the diameter and number of slices for each pizza into a Double and an Int respectively if both of these values can be obtained from the strings, use your first function to try to compute the area, otherwise the area for that slice is nil. Once the areas of both slices are obtained, compare the two areas using the following rules:
//
//If slice A's area is a Double and slice B's is nil, return "Slice A is bigger". If the reverse is true, return "Slice B is bigger".
//If both areas are Doubles, return "Slice A is bigger" or "Slice B is bigger" according to which slice has the greater area.
//If both areas are nil, or if both are Doubles and they are equal, return "Neither slice is bigger".
func biggestSlice(
    diameterA: String, slicesA: String,
    diameterB: String, slicesB: String
) -> String {
    let sizeA = (sliceSize(diameter: Double(diameterA), slices: Int(slicesA))) ?? -1
    let sizeB = (sliceSize(diameter: Double(diameterB), slices: Int(slicesB))) ?? -1
    if sizeA > sizeB {
        return "Slice A is bigger"
    } else if sizeB > sizeA {
        return "Slice B is bigger"
    }
    return "Neither slice is bigger"
}

final class SliceSizing: XCTestCase {
    //Task 1 Tests
    func testSliceNormal(){
        let diameter: Double = 16
        let slices : Int = 12
        let expectedOutput: Double = 16.75516081914556
        let output = sliceSize(diameter: diameter, slices: slices)
        XCTAssertEqual(output!, expectedOutput, accuracy:0.01)
    }
    func testSliceInvalidDiameter(){
        let diameter: Double? = -10
        let slices : Int = 5
        let output = sliceSize(diameter: diameter, slices: slices)
        XCTAssertNil(output)
    }
    func testSliceInvalidSlices(){
        let diameter: Double = 10
        let slices : Int? = 0
        let output = sliceSize(diameter: diameter, slices: slices)
        XCTAssertNil(output)
    }
    func testSliceNilDiameter(){
        let diameter: Double? = nil
        let slices : Int = 5
        let output = sliceSize(diameter: diameter, slices: slices)
        XCTAssertNil(output)
    }
    func testSliceNilSlices(){
        let diameter: Double = 10
        let slices : Int? = nil
        let output = sliceSize(diameter: diameter, slices: slices)
        XCTAssertNil(output)
    }
    //Task 2 Tests
    func testBiggestA() {
        let biggest = biggestSlice(diameterA: "16", slicesA: "8", diameterB: "12", slicesB: "6")
        XCTAssertEqual(biggest, "Slice A is bigger")
    }
    func testBiggestB() {
        let biggest = biggestSlice(diameterA: "16", slicesA: "10", diameterB: "18", slicesB: "6")
        XCTAssertEqual(biggest, "Slice B is bigger")
    }
    func testBiggestATie() {
        let biggest = biggestSlice(diameterA: "16", slicesA: "10", diameterB: "16", slicesB: "10")
        XCTAssertEqual(biggest, "Neither slice is bigger")
    }
    func testBiggestANil() {
        let biggest = biggestSlice(diameterA: "-16", slicesA: "10", diameterB: "16", slicesB: "10")
        XCTAssertEqual(biggest, "Slice B is bigger")
    }
    func testBiggestBNil() {
        let biggest = biggestSlice(diameterA: "16", slicesA: "10", diameterB: "-16", slicesB: "10")
        XCTAssertEqual(biggest, "Slice A is bigger")
    }
    func testBiggestBothNil() {
        let biggest = biggestSlice(diameterA: "16 inches", slicesA: "10", diameterB: "18 inches", slicesB: "10")
        XCTAssertEqual(biggest, "Neither slice is bigger")
    }
    func testZeroIsValid() {
        let biggest = biggestSlice(diameterA: "0", slicesA: "10", diameterB: "-16", slicesB: "10")
        XCTAssertEqual(biggest, "Slice A is bigger")
    }
}
