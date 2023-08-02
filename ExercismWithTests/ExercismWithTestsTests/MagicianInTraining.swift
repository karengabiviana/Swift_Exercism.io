//
//  MagicianInTraining.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 02/08/23.
//

import XCTest
//As a magician-to-be, Elyse needs to practice some basics. She has a stack of cards that she wants to manipulate.
//
//To make things a bit easier she only uses the cards 1 to 10.

//Task 1 - Implement the function getCard(at:from:) that returns the card at position index from the given stack.
func getCard(at index: Int, from stack: [Int]) -> Int{
    stack[index]
}
final class MagicianInTraining: XCTestCase {
    //Task 1 Tests
    func testGetCard() {
        XCTAssertEqual(getCard(at: 2, from: [1, 2, 4, 1]), 4)
    }
}
