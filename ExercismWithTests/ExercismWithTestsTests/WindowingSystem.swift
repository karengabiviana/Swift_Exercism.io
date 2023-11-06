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

    //Task 4
    //resize(to:) : (Size) -> () - This method takes a Size struct as input and attempts to resize the window to the specified size. However, the new size cannot exceed certain bounds. - The minimum allowed height or width is 1. Requested heights or widths less than 1 will be clipped to 1. - The maximum height and width depends on the current position of the window, the edges of the window cannot move past the edges of the screen. Values larger than these bounds will be clipped to the largest size they can take. E.g. if the window's position is at x = 400, y = 300 and a resize to height = 400, width = 300 is requested, then the window would be resized to height = 300, width = 300 as the screen is not large enough in the y direction to fully accommodate the request.
    func resize(to newSize: Size) -> () {
        size = Size(
            width: min(max(1, newSize.width), screenSize.width - position.x),
            height: min(max(1,newSize.height), screenSize.height - position.y))
    }
    //Task 5
    //move(to:) : (Position) -> () - This is similar to resize(to:), however, this method adjusts the position of the window to the requested value, rather than the size. As with resize the new position cannot exceed certain limits. - The smallest position is 0 for both x and y. - The maximum position in either direction depends on the current size of the window; the edges cannot move past the edges of the screen. Values larger than these bounds will be clipped to the largest size they can take. E.g. if the window's size is at x = 250, y = 100 and a move to x = 600, y = 200 is requested, then the window would be moved to x = 550, y = 200 as the screen is not large enough in the x direction to fully accommodate the request.
    func move(to newPosition: Position) {
        position = Position(
            x: min(max(0, newPosition.x), screenSize.width - size.width),
            y: min(max(0, newPosition.y), screenSize.height - size.height))
    }
    //Task 6
    //update(title:) : (String) -> () - This method sets the title property to the value of the string that was passed in.
    func update(title: String) {
        self.title = title
    }
    //update(text:) : (String?) -> () - This method sets the contents property to the value of the optional string that was passed in.
    func update(text: String?) {
        contents = text
    }
    //display() : () -> String - This method returns a string describing the current state of the window. For example, if the window has the title "My First Window" with position: x = 10, y = 100; size: width = 200, height = 150; and contents: "I 😍 my window", it should return the string: "My First Window\nPosition: (10, 100), Size: (200 x 150)\nI 😍 my window\n" - If contents is nil, the last line should read "[This window intentionally left blank]"
    func display() -> String {
        "\(title)\nPosition: (\(position.x), \(position.y)), Size: (\(size.width) x \(size.height))\n\(contents ?? "[This window intentionally left blank]")\n"
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
    //Task 4 Tests
    func testResizeFromWindowZero() {
        let window = Window()
        window.position = Position(x: 400, y: 300)
        window.size = Size(width: 0, height: 400)
        window.resize(to: window.size)
        let expected = Size(width: 1, height: 300)
        XCTAssertTrue(window.size.height == expected.height && window.size.width == expected.width)
    }

    func testResizeFromWindow() {
        let window = Window()
        window.position = Position(x: 400, y: 300)
        window.size = Size(width: 300, height: 400)
        window.resize(to: window.size)
        let expected = Size(width: 300, height: 300)
        XCTAssertTrue(window.size.height == expected.height && window.size.width == expected.width)

    }
    //Task 5 Tests
    func testMove() {
        let window = Window()
        window.size = Size(width: 250, height: 400)
        window.position = Position(x: 250, y: 100)
        let newPosition = Position(x: 600, y: 200)
        window.move(to: newPosition)
        let expected = Position(x: 550, y: 200)
        print(window.position.x, window.position.y)
        XCTAssertTrue(window.position.x == expected.x && window.position.y == expected.y)
    }

    func testMoveLessThanZero() {
        let window = Window()
        window.size = Size(width: 250, height: 400)
        window.position = Position(x: 250, y: 100)
        let newPosition = Position(x: -2, y: 200)
        window.move(to: newPosition)
        let expected = Position(x: 0, y: 200)
        print(window.position.x, window.position.y)
        XCTAssertTrue(window.position.x == expected.x && window.position.y == expected.y)
    }
    //Task 6 tests
    func testUpdateTitle() {
        let window = Window()
        window.update(title: "Title")
        let expected = "Title"
        XCTAssertEqual(window.title, expected)
    }

    func testUpdatText() {
        let window = Window()
        window.update(text: "Is it an optional?")
        let expected = "Is it an optional?"
        XCTAssertEqual(window.contents, expected)
    }

    func testDisplay() {
        let window = Window()
        window.title = "My First Window"
        window.size = Size(width: 200, height: 150)
        window.position = Position(x: 10, y: 100)
        window.contents = "I 😍 my window"
        let output = window.display()
        let expected = "My First Window\nPosition: (10, 100), Size: (200 x 150)\nI 😍 my window\n"
        XCTAssertEqual(output, expected)
    }
    func testDisplayWithEmptyContents() {
        let window = Window()
        window.title = "My First Window"
        window.size = Size(width: 200, height: 150)
        window.position = Position(x: 10, y: 100)
        window.contents = nil
        let output = window.display()
        let expected = "My First Window\nPosition: (10, 100), Size: (200 x 150)\n[This window intentionally left blank]\n"
        XCTAssertEqual(output, expected)
    }
}
