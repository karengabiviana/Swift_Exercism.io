//
//  WindowingSystem.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 16/10/23.
//
import XCTest
//In this exercise, you will be simulating a windowing based computer system. You will create some windows that can be moved and resized and display their contents. The following image is representative of the values you will be working with below.
//<--------------------- screenSize.width --------------------->
//
//^          ╔════════════════════════════════════════════════════════════╗
//|          ║                                                            ║
//|          ║          position.x,_                                      ║
//|          ║          position.y  \                                     ║
//|          ║                       \<----- size.width ----->            ║
//|          ║                 ^      *──────────────────────┐            ║
//|          ║                 |      │        title         │            ║
//|          ║                 |      ├──────────────────────┤            ║
//screenSize.height ║                 |      │                      │            ║
//|          ║            size.height │                      │            ║
//|          ║                 |      │       contents       │            ║
//|          ║                 |      │                      │            ║
//|          ║                 |      │                      │            ║
//|          ║                 v      └──────────────────────┘            ║
//|          ║                                                            ║
//|          ║                                                            ║
//v          ╚════════════════════════════════════════════════════════════╝

//Task 1
//Define a struct named Size with two Int properties, width and height that store the window's current width and height, respectively. The initial width and height should be 80 and 60, respectively. Include a method resize(newWidth:newHeight:) that takes new width and height parameters and changes the properties to reflect the new size.
// TODO: Define the Size struct
struct Size {
    var width = 80
    var height = 60

    mutating func resize(newWidth: Int, newHeight: Int) {
        width = newWidth
        height = newHeight
    }
}

class  WindowingSystemTest: XCTestCase {
    //Task 1 Tests
    func testSizeAndResize() {
        let size1080x764 = Size(width: 1080, height: 764)
        var size1200x800 = size1080x764
        size1200x800.resize(newWidth: 1200, newHeight: 800)
        
        let output = size1200x800
        let outputExpected = (width: 1200, height: 800)
        
        XCTAssertTrue(output.width == outputExpected.width && output.height == outputExpected.height )
    }
}
