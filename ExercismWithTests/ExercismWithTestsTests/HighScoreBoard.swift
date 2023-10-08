//
//  HighScoreBoard.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 08/10/23.
//

import XCTest

//In this exercise, you're implementing a way to keep track of the high scores for the most popular game in your local arcade hall.

//You have 7 functions to implement, all related to returning and manipulating a dictionary of high score data.

class HighScoreBoard {
    //Task 1 - Create a function newScoreBoard() that takes no parameters and returns a new high score dictionary which uses values of type String for the keys and values of type Int as the values.
    func newScoreBoard() -> [String: Int] {
      return [:]
    }
    //Task 2 - To add a player to the high score dictionary, define addPlayer, which is a function which takes 3 parameters:

    //The first parameter is the dictionary of scores. This should be an in-out parameter.
    //The second parameter is the name of a player as a string.
    //The third parameter is the score as an integer. The parameter is optional, implement the third parameter with a default value of 0.
    func addPlayer(_ scores: inout [String: Int], _ name: String, _ score: Int = 0) {
        scores[name] = score
    }
}

class HighScoreBoardTests: XCTestCase {
    let highScoreBoard = HighScoreBoard()

    //Task 1 Tests
    func testNewScore() {
        XCTAssertEqual(highScoreBoard.newScoreBoard(), [:])
    }

    //Task 2 Tests
    var scoreBoard: [String : Int] = [:]

    func testAddPlayerZero() {
        highScoreBoard.addPlayer(&scoreBoard, "Karen")
        let output = scoreBoard
        let outputExpected = ["Karen": 0]
        XCTAssertTrue( output == outputExpected )
    }

    func testAddPlayerScore() {
        highScoreBoard.addPlayer(&scoreBoard, "Breno", 100)
        let output = scoreBoard
        let outputExpected = ["Breno": 100]
        XCTAssertTrue( output == outputExpected )
    }
}
