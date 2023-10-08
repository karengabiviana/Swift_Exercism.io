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
}

class HighScoreBoardTests: XCTestCase {
    let highScoreBoard = HighScoreBoard()
    //Task 1 Tests
    func testNewScore() {
        XCTAssertEqual(highScoreBoard.newScoreBoard(), [:])
    }
}
