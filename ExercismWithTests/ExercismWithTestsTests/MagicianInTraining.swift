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
//Task 3 - Implement the function insert(_:atTopOf:) that returns a copy of the stack with the new card provided added to the top of the stack.
func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
    var copyStack = stack
    copyStack.append(newCard)
    return copyStack
}

//Task 4 - Implement the function removeCard(at:from:) that returns a copy of the stack which has had the card at position index removed. If the given index is not a valid index in the stack, the original stack should be returned, unchanged.
func removeCard(at index: Int, from stack: [Int]) -> [Int] {
    var copyStack = stack
    if index >= 0 && index <= copyStack.count {
        copyStack.remove(at: index)
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
    //Task 3 Tests
    func testInsertAtTop() {
        let stack = [1, 7, 5, 8, 3, 9, 6, 4, 2]
        XCTAssertEqual(insert(10, atTopOf: stack), [1, 7, 5, 8, 3, 9, 6, 4, 2, 10])
    }
    // Task 4 Tests
    func testRemoveCard() {
        XCTAssertEqual(removeCard(at: 2, from: [9, 2, 1, 6, 5, 7, 4, 3, 8]), [9, 2, 6, 5, 7, 4, 3, 8])
    }
    func testRemoveCardindexTooLow() {
        let stack = [9, 2, 1, 6, 5, 7, 4, 3, 8]
        XCTAssertEqual(removeCard(at: -2, from: stack), stack)
    }
    func testRemoveCardindexTooHigh() {
        let stack = [9, 2, 1, 6, 5, 7, 4, 3, 8]
        XCTAssertEqual(removeCard(at: 20, from: stack), stack)
    }
}
