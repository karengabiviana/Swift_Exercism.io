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

//Task 2 - Implement the function setCard(at:in:to) that returns a new stack that is a copy of the input stack but which has the card at position index changed to the new card provided. If the given index is not a valid index in the stack, the original stack should be returned, unchanged.
func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
    var copyStack = stack
    if index <= copyStack.count && index >= 0 {
            copyStack[index] = newCard
        }
    return copyStack
}
final class MagicianInTraining: XCTestCase {
    //Task 1 Tests
    func testGetCard() {
        XCTAssertEqual(getCard(at: 2, from: [1, 2, 4, 1]), 4)
    }
    //Task 2 Tests
    func testSetCard() {
        XCTAssertEqual(setCard(at: 2, in: [1, 2, 4, 1], to: 6), [1, 2, 6, 1])
    }
    func testSetCardTooLow() {
        let stack = [9, 4, 3, 6, 1, 7, 2, 8, 5]
        XCTAssertEqual(setCard(at: -3, in: stack, to: 10), stack)
    }
    func testSetCardTooHigh() {
        let stack = [9, 4, 3, 6, 1, 7, 2, 8, 5]
        XCTAssertEqual(setCard(at: 50, in: stack, to: 10), stack)
    }
}
