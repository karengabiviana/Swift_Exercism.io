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

//Task 5 - Implement the function removeTopCard(_:) that returns a copy of the stack which has had the card at the top of the stack removed. If the given stack is empty, the original stack should be returned, unchanged.
func removeTopCard(_ stack: [Int]) -> [Int] {
    var copyStack = stack
    return removeCard(at: copyStack.count - 1, from: copyStack)
}

//Task 6 - Implement the function insert(_:atBottomOf:) that returns a copy of the stack with the new card provided added to the bottom of the stack.
func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
    var copyStack = stack
    copyStack.insert(newCard, at: 0)
    return copyStack
}

//Task 7 - Implement the function removeBottomCard(_:) that returns a copy of the stack which has had the card at the bottom of the stack removed. If the given stack is empty, the original stack should be returned, unchanged.
func removeBottomCard(_ stack: [Int]) -> [Int] {
    var copyStack = stack
    if !stack.isEmpty{
        copyStack.remove(at: 0)
    }
    return copyStack
}

//Task 8 - Implement the function checkSizeOfStack(_:_:) that checks whether the size of the stack is equal to a given stackSize or not.
func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool{
    stack.count == size
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
    //Task 5 Tests
    func testRemoveTopCard() {
        XCTAssertEqual( removeTopCard([2, 7, 4, 6, 9, 1, 8, 3, 5]), [2, 7, 4, 6, 9, 1, 8, 3])
    }
    func testRemoveTopCardEmptyStack() {
        XCTAssertEqual( removeTopCard([]), [])
    }
    //Task 6 Tests
    func testInsertAtBottom(){
        XCTAssertEqual(insert(10, atBottomOf: [4, 3, 8, 9, 1, 7, 6, 5, 2]), [10, 4, 3, 8, 9, 1, 7, 6, 5, 2])
    }
    //Task 7 Tests
    func testRemoveBottomCardFullStack(){
        XCTAssertEqual(removeBottomCard([8, 7, 4, 2, 6, 5, 3, 1, 9]), [7, 4, 2, 6, 5, 3, 1, 9])
    }
    func testRemoveBottomCardEmptyStack(){
        XCTAssertEqual(removeBottomCard([]), [])
    }
    //Task 8 Tests
    func testCheckSizeTrue() {
        XCTAssertTrue(checkSizeOfStack([6, 9, 7, 8, 2, 3, 4, 5, 1], 9))
    }
    func testCheckSizeFalse() {
        XCTAssertFalse(checkSizeOfStack([6, 9, 7, 8, 2, 3, 4, 5, 1], 3))
    }
}
