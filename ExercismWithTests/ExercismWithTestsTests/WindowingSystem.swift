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
//Task 2
//Define a struct named Position with two Int properties, x and y that store the current horizontal and vertical position, respectively, of the window's upper left corner. The initial values of x and y should each be 0. The position (0, 0) is the upper left corner of the screen with x values getting larger as you move right and y values getting larger as you move down.
//Include a method moveTo(newX:newY:) that takes new x and y parameters and changes the properties to reflect the new position.
// TODO: Define the Position struct
struct Position {
    var x = 0
    var y = 0

    mutating func moveTo(newX: Int, newY: Int) {
        x = newX
        y = newY
    }
}
//Task 3
//Define a window class with the following properties:
//title : String, Initial value is "New Window"
//screenSize : Size, constant value with width = 800 and height = 600
//size : Size, initial value is the default value of the Size struct
//position : Position, initial value is the default value of the Position struct
//contents : String?, initial value is nil
// TODO: Define the Window class
class Window {
    var title: String = "New Window"
    let screenSize = Size(width: 800, height: 600)
    var size = Size()
    var position = Position()
    var contents: String? = nil
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

    //Task 2 Tests
    func testPositionMoveTo() {
        var point = Position(x: 10, y: 20)
        point.moveTo(newX: 100, newY: -100)

        let output = point
        let outputExpected = (newX: 100, newY: -100)

        XCTAssertTrue(output.x == outputExpected.newX && output.y == outputExpected.newY)
    }

    //Task 3 Tests
        func testWindowClass() {
            let window = Window()
            XCTAssertTrue(window.title == "New Window" &&
                          window.screenSize.width == 800 &&
                          window.screenSize.height == 600 &&
                          window.size.width == 80 &&
                          window.size.height == 60 &&
                          window.position.x == 0 &&
                          window.position.y == 0 &&
                          window.contents == nil)

        }
}
