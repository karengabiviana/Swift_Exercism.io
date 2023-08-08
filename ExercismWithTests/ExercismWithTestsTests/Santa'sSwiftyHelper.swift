//
//  Santa'sSwiftyHelper.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 08/08/23.
//

import XCTest

//You are an elf working in Santa Claus' logistics division and you have been given a pair of tasks from the boss for upgrading the system's software.
//
//Task 1 - our first task is updating the complex number array that helps run Santa's sleigh. The boss discovered that the last development team stored the arrays using Cartesian coordinates rather than polar coordinates, which everyone knows are the boss' favorite.

//For this task you will need to implement the function cartesianToPolar(_:) that takes in a tuple, (x: Double, y: Double), and return a new tuple, (r: Double, phi: Double), where:
//
//r = √(x2 + y2)
//phi = atan2(y, x)

func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
    let r = sqrt(pow(cart.x, 2) + pow(cart.y, 2))
    let phi: Double = atan2( cart.y, cart.x )
    let polar = (r, phi)
    return polar
}
//Task 2 - or your second task, your boss is upgrading its database and is modifying its record structures. They want to combine the records from the toy production database and the toy recipient databases to save space and give the product leads better visibility into the demand for their toy.

//For this task you will implement the function combineRecords(production:gifts:) that takes two tuples as input, production: (toy: String, id: Int, productLead: String) and gifts: (Int, [String]) and your function will return a combined tuple, (id: Int, toy: String, productLead: String, recipients: [String]). Note that the two id fields in the input tuples are guaranteed to be the same value.

func combineRecords(
  production: (toy: String, id: Int, productLead: String),
  gifts: (Int, [String])
) -> (id: Int, toy: String, productLead: String, recipients: [String]) {

    (id: production.id, toy: production.toy, productLead: production.productLead, recipients: gifts.1)
}

final class Santa_sSwiftyHelper: XCTestCase {
    //Task 1 Tests
    func testCartesianToPolar() {
        let coordinate = (x: 11.713, y: 5.6405)
        let output = cartesianToPolar(coordinate)
        let expected = (r: 13.0, phi: 0.4488)
        XCTAssertEqual(output.r, expected.r, accuracy: 0.01)
        XCTAssertEqual(output.phi, expected.phi, accuracy: 0.01)
    }
    func testCartesianToPolarNegative() {
        let coordinate = (x: -4.7292, y: -2.4096)
        let output = cartesianToPolar(coordinate)
        let expected = (r: 5.3077, phi:-2.6704)
        XCTAssertEqual(output.r, expected.r, accuracy: 0.01)
        XCTAssertEqual(output.phi, expected.phi, accuracy: 0.01)
    }
    //Task 2 Tests
        func testCombineRecords() {
            let id = Int.random(in: 0..<1_000_000)
            let toy =
              ["Chemistry set", "Race car", "Box kite", "Building brick set", "Talking doll"]
              .randomElement()!
            let productLead =
              ["Binkles", "Snowii", "Jinkies", "Pippi", "Zippit", "Xandi", "Alf"]
              .randomElement()!
            let children =
              [
                "Inara", "Maxime", "Bandile", "Shaurya", "Breno", "Anita", "Yael",
                "Dimitrios", "Lufy", "Iminathi", "Valeria", "Marlon", "Mitsuki",
                "Bjarni", "Venla", "Anton", "Beatriz", "Joo-won", "Zahra", "Liam", "Parker",
              ]
            let numberOfRecipients = Int.random(in: 0..<children.count)
            let recipients = Array(children.shuffled().prefix(numberOfRecipients))
            let actual =
              combineRecords(
                production: (toy: toy, id: id, productLead: productLead),
                gifts: (id, recipients)
              )
            XCTAssertTrue(
              actual.id == id && actual.toy == toy && actual.productLead == productLead
                && actual.recipients == recipients
            )
        }
}
