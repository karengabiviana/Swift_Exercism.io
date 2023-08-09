//
//  MasterMixologist.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 09/08/23.
//

import XCTest

//You are a master mixologist, making tasty drinks for the public to enjoy on their nights out. But you figured that you could make your life easier by writing a bit of code to help you with your job.

//Task 1 - Different drinks take different amount of time to prepare: "beer", "soda", and "water" take 0.5 minutes each, "shot"s take 1.0 minutes, "mixed drink"s take 1.5 minutes, "fancy drink"s take 2.5 minutes and "frozen drink"s take 3.0 minutes.

//Implement the function timeToPrepare(drinks: [String]) -> Double which takes a non-empty array of drinks and returns the total time required to make the order.
func timeToPrepare(drinks: [String]) -> Double{
    var time = 0.0
        for drink in drinks {
            switch drink {
            case "beer", "soda", "water":
                time += 0.5
            case "shot" :
                time += 1.0
            case "mixed drink":
                time += 1.5
            case "fancy drink":
                time += 2.5
            case "frozen drink":
                time += 3.0
            default:
                time += 0.0
        }
      }
        return time
}

// Task 2 - One of the first things you need to do when you start your shift is to make sure your little bin of lime wedges is full for the shift ahead. Implement the function makeWedges(needed: Int, limes: [String]) -> Int, which takes the number of lime wedges you need to cut and an array representing the supply of whole limes you have on hand. You can get 6 wedges from a "small" lime, 8 wedges from a "medium" lime and 10 from a "large" lime. While you still need more wedges and you still have more limes to cut up, take the first lime out of the array, and subtract the appropriate number of wedges from the amount you need. Keep going until you don't need any more wedges or you run out of limes.
//Return the number of limes you cut up.
func makeWedges(needed: Int, limes: [String]) -> Int{
    var limeWedges = 0
       var remainingWedges = needed

       for lime in limes {

           if remainingWedges <= 0 {break}

           switch lime {
           case "small":
               remainingWedges -= 6
           case "medium":
               remainingWedges -= 8
           case "large":
               remainingWedges -= 10
           default:
               break
           }
           limeWedges += 1
       }
       return limeWedges
}

//Task 3 - Congratulations! Your long work day is nearly done and you will soon be going home to work on your new app. But you still have a stream of drink orders to make before you can hand off the orders to the next shift and leave.

//Implement the function finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] which takes in the number of minutes left in your shift (guaranteed to be greater than 0), and a non-empty array of drink orders. As long as you still have time left in your shift you are to make the first order in the Array and then remove that order from the array. You can then subtract the amount of time it took to prepare that order, according to your function timeToPrepare(drinks:) from the time left on your shift. Your function should return the array of orderes that you have not yet gotten to before the end of your shift.
//
//And good news! If you make all of the orders with time left on your shift you get to go home early!

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var orders = remainingOrders
    var minutes = Double(minutesLeft)

    while minutes > 0 && !orders.isEmpty{
        minutes -= timeToPrepare(drinks: orders[0])
        orders.remove(at: 0)
    }
    return orders
}

final class MasterMixologist: XCTestCase {
    //Task 1 tests
    func testTimeToPrepare() {
        XCTAssertEqual(timeToPrepare(drinks: ["beer", "frozen drink", "shot"]), 4.5)
    }
    func testTimeToPrepareEmptyArray() {
        XCTAssertEqual(timeToPrepare(drinks: []), 0.0)
    }
    func testTimeToPrepareToMuchWork() {
        XCTAssertEqual(timeToPrepare(drinks: ["beer", "frozen drink", "shot", "mixed drink", "frozen drink", "soda", "fancy drink", "water","beer", "frozen drink", "shot", "mixed drink", "frozen drink", "soda", "fancy drink", "water"]), 25)
    }
    //Task 2 tests
    func testMakeWedges() {
        XCTAssertEqual(makeWedges(needed: 42, limes: ["small", "large", "large", "medium", "small", "large", "large"]), 6)
    }
    func testMakeWedgesNoNeed() {
        XCTAssertEqual(makeWedges(needed: 0, limes: ["small", "large", "large", "medium", "small", "large", "large"]), 0)
    }
    func testMakeWedgesNoLimes() {
        XCTAssertEqual(makeWedges(needed: 42, limes: []), 0)
    }
    func testMakeWedgesTooMuchLimes() {
        XCTAssertEqual(makeWedges(needed: 80, limes: ["small", "large", "large", "medium", "small", "large", "large"]), 7)
    }
    //Task 3 tests
    func testFinishShift() {
        XCTAssertEqual(finishShift(minutesLeft: 5, remainingOrders: [["beer", "frozen drink", "shot"], ["fancy drink", "soda"], ["beer", "beer", "water"], ["mixed drink", "frozen drink"]]), [["beer", "beer", "water"], ["mixed drink", "frozen drink"]])
    }
    func testFinishShiftJustRunOver() {
        XCTAssertEqual(finishShift(minutesLeft: 10, remainingOrders: [["beer", "frozen drink", "shot"], ["fancy drink", "soda"], ["beer", "beer", "water"], ["mixed drink", "frozen drink"]]), [])
    }
    func testFinishShiftLeaveEarly() {
        XCTAssertEqual(finishShift(minutesLeft: 120, remainingOrders: [["beer", "frozen drink", "shot"], ["fancy drink", "soda"], ["beer", "beer", "water"], ["mixed drink", "frozen drink"]]), [])
    }
}
