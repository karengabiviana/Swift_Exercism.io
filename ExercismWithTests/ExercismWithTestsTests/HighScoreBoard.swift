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
    //Task 3 - To remove a player from the high score dictionary, define removePlayer, which takes 2 parameters:

    //The first parameter is the dictionary of scores. This should be an in-out parameter.
    //The second parameter is the name of the player as a string.
    //This function should remove the player from the dictionary if they are in it and do nothing otherwise.
    func removePlayer(_ scores: inout [String: Int], _ name: String) {
        scores.removeValue(forKey: name)
    }

    //Task 4 - To reset a player's score, define resetPlayer, which takes 2 parameters:

    //The first parameter is the dictionary of scores. This should be an in-out parameter.
    //The function will set the score of the player to 0. If the player is not in the dictionary, then nothing should happen.
    func resetScore(_ scores: inout [String: Int], _ name: String) {
        if scores.keys.contains(name) {
            scores[name] = 0
        }
    }

    //Task 5 - To update a players score by adding to the previous score, define updateScore, which takes 3 parameters:

    //The first parameter is the dictionary of scores. This should be an in-out parameter.
    //The second parameter is the name of the player as a string, whose score you wish to update.
    //The third parameter is the score that you wish to add to the stored high score.
    func updateScore(_ scores: inout [String: Int], _ name: String, _ delta: Int) {
        if let oldScore = scores[name] {
            scores[name] = oldScore + delta
        }
    }
}

class HighScoreBoardTests: XCTestCase {
    let highScoreBoardClass = HighScoreBoard()

    //Task 1 Tests
    func testNewScore() {
        XCTAssertEqual(highScoreBoardClass.newScoreBoard(), [:])
    }

    //Task 2 Tests
    var scoreBoard: [String : Int] = [:]

    func testAddPlayerZero() {
        highScoreBoardClass.addPlayer(&scoreBoard, "Karen")
        let output = scoreBoard
        let outputExpected = ["Karen": 0]
        XCTAssertTrue( output == outputExpected )
    }

    func testAddPlayerScore() {
        highScoreBoardClass.addPlayer(&scoreBoard, "Breno", 100)
        let output = scoreBoard
        let outputExpected = ["Breno": 100]
        XCTAssertTrue( output == outputExpected )
    }

    //Task 3 Tests
    func testRemovePlayerWhoIsInBoard() {
        highScoreBoardClass.addPlayer(&scoreBoard, "Breno", 100)
        highScoreBoardClass.addPlayer(&scoreBoard, "Suz", 85)
        highScoreBoardClass.removePlayer(&scoreBoard, "Suz")
        let output = scoreBoard
        let outputExpected = ["Breno": 100]
        XCTAssertTrue( output == outputExpected )
    }

    func testRemovePlayerWhoIsNotInBoard() {
        highScoreBoardClass.addPlayer(&scoreBoard, "Giovani", 80)
        highScoreBoardClass.removePlayer(&scoreBoard, "Teo")
        let output = scoreBoard
        let outputExpected = ["Giovani": 80]
        XCTAssertTrue( output == outputExpected )
    }

    //Task 4 Tests
    func testResetPlayerScore() {
        highScoreBoardClass.addPlayer(&scoreBoard, "Lucas", 70)
        highScoreBoardClass.resetScore(&scoreBoard, "Lucas")
        let output = scoreBoard
        let outputExpected = ["Lucas": 0]
        XCTAssertTrue( output == outputExpected )
    }
    func testResetPlayerScoreIsNotInBoard() {
        highScoreBoardClass.addPlayer(&scoreBoard, "Breno", 100)
        highScoreBoardClass.resetScore(&scoreBoard, "Lucas")
        let output = scoreBoard
        let outputExpected = ["Breno": 100]
        XCTAssertTrue( output == outputExpected )
    }

    //Task 5 Tests
    func testUpdateScore() {
        highScoreBoardClass.addPlayer(&scoreBoard, "Diego", 27)
        highScoreBoardClass.addPlayer(&scoreBoard, "Bituca", 48)
        highScoreBoardClass.addPlayer(&scoreBoard, "Tokyo", 84)
        highScoreBoardClass.addPlayer(&scoreBoard, "Mushu", 13)
        highScoreBoardClass.updateScore(&scoreBoard, "Bituca", 37)
        let output = scoreBoard
        let outputExpected = [ "Diego": 27, "Bituca": 85, "Tokyo": 84,"Mushu": 13 ]
        print(output)
        XCTAssertTrue( output == outputExpected )
    }
    func testUpdateScoreNameDoesNotExist() {
        highScoreBoardClass.addPlayer(&scoreBoard, "Bituca", 48)
        highScoreBoardClass.updateScore(&scoreBoard, "Diego", 37)
        let output = scoreBoard
        let outputExpected = ["Bituca": 48]
        XCTAssertTrue( output == outputExpected )
    }
}
