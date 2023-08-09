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
}
