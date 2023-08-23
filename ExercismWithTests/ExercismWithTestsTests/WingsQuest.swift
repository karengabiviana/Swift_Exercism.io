//
//  WingsQuest.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 23/08/23.
//

import XCTest

//You are in process of developing the new highly appreciated game Wings Quest. In the game you are a bird that moves around and collects seeds. The player wins by picking up all the seeds. If the player comes in contact with an eagle, then the player will lose all their seeds and lose the game. There is an exception to this rule: the player can have an active power-up that makes them fly higher than other birds.

//Your goal is to write some rules that will be used in the game.

//Task 1 - In the game, the bird will get bonus points if they touch an eagle while having a power-up.

//Define the function bonusPoints(powerUpActive:touchingEagle:) that takes two arguments powerUpActive, which holds if the bird has an active power-up, and the argument touchingEagle which holds if the bird is touching an eagle. The function should return true only if the bird has a power-up active and is touching an eagle, and false otherwise.
func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
    if powerUpActive == true && touchingEagle == true {
        return true
    } else {
        return false
    }
}

//Task 02 - In the game, the player gets points when picking up a seed or a power-up.

//Define the function score(touchingPowerUp:touchingSeed:) that takes two arguments touchingPowerUp, which holds if the bird is touching a power-up, the argument touchingSeed which holds if the bird is touching a seed. The function should return true if the bird is touching a power-up or a seed, and return false otherwise.
func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
    if touchingSeed || touchingPowerUp {
        return true
    } else {
        return false
    }

}

final class WingsQuest: XCTestCase {
    //Task 1 tests
    func testBonusPointsTrue() {
        XCTAssertTrue(bonusPoints(powerUpActive: true, touchingEagle: true))
    }
    func testBonusPointsFalseWithPowerUp() {
        XCTAssertFalse(bonusPoints(powerUpActive: true, touchingEagle: false))
    }
    func testBonusPointsFalseTouchingEagle() {
        XCTAssertFalse(bonusPoints(powerUpActive: false, touchingEagle: true))
    }
    func testBonusPointsFalseBothFalse() {
        XCTAssertFalse(bonusPoints(powerUpActive: false, touchingEagle: false))
    }
    //Task 2 tests
    func testScorePowerUPTrue() {
        XCTAssertTrue(score(touchingPowerUp: true, touchingSeed: false))
    }
    func testScoreSeedTrue() {
        XCTAssertTrue(score(touchingPowerUp: false, touchingSeed: true))
    }
    func testScoreBothTrue() {
        XCTAssertTrue(score(touchingPowerUp: true, touchingSeed: true))
    }
    func testScoreBothFalse() {
        XCTAssertFalse(score(touchingPowerUp: false, touchingSeed: false))
    }
}
