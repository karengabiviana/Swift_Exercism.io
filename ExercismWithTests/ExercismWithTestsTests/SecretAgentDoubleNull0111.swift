//
//  SecretAgentDoubleNull0111.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 27/07/23.
//

import XCTest
//Hello, Agent Double-Null0111.
//
//Your mission, should you choose to accept it, is to write a pair of tools to help you infiltrate UMBRA (United Minions Being Really Awful) headquarters and retrieve the plans for their latest really awful scheme. There are two tools you will need to carry out this mission.

//Task 1 - Once you have the secret plans, you will need to protect it so that only those who know the password can recover them.
//In order to do this, you will need to implement the function protectSecret(_ secret: String, withPassword password: String) -> (String) -> String. This function will return another function that takes possible password strings as input. If the entered password is correct the new function returns the hidden secret, but if it is the incorrect password the function returns "Sorry. No hidden secrets here."
func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
    func tryDiscoverSecret(_ guessing: String) -> String {
        if guessing == password {
            return secret
        }
        return "Sorry. No hidden secrets here."
    }
    return tryDiscoverSecret
}

final class SecretAgentDoubleNull0111: XCTestCase {
//Task 1 Tests
    func testPasswordSuccess() {
        let protected = protectSecret("UMBRA will fill everyone's sugar bowls with salt!", withPassword: "P455w0rd")
        XCTAssertEqual(protected("P455w0rd"), "UMBRA will fill everyone's sugar bowls with salt!")
    }
    func testPasswordFailure() {
        let protected = protectSecret("UMBRA will fill everyone's sugar bowls with salt!", withPassword: "P455w0rd")
        XCTAssertEqual(protected("Hunter2"), "Sorry. No hidden secrets here.")
    }
}
