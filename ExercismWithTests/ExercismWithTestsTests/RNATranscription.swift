//
//  RNATranscription.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 02/02/24.
//

import Foundation
import XCTest

//*Introduction*
//You work for a bioengineering company that specializes in developing therapeutic solutions.
//Your team has just been given a new project to develop a targeted therapy for a rare type of cancer.


//*Note*
//It's all very complicated, but the basic idea is that sometimes people's bodies produce too much of a given protein. That can cause all sorts of havoc.
//But if you can create a very specific molecule (called a micro-RNA), it can prevent the protein from being produced.
//This technique is called RNA Interference.


//*Instructions*
//Your task is determine the RNA complement of a given DNA sequence.
//Both DNA and RNA strands are a sequence of nucleotides.
//The four nucleotides found in DNA are adenine (A), cytosine (C), guanine (G) and thymine (T).
//The four nucleotides found in RNA are adenine (A), cytosine (C), guanine (G) and uracil (U).
//Given a DNA strand, its transcribed RNA strand is formed by replacing each nucleotide with its complement:

//G -> C
//C -> G
//T -> A
//A -> U

func toRna(_ dna: String) -> String {
    let dnaUpperCase = dna.uppercased()
    let dnaArray = Array(dnaUpperCase)
    var rna = ""
    let sequences = dnaArray.count
    for sequence in 0..<sequences {
        switch dnaArray[sequence] {
        case "G":
            rna += "C"
        case "C":
            rna += "G"
        case "T":
            rna += "A"
        case "A":
            rna += "U"
        default:
            rna = ""
        }
    }

    return rna
}

class RNATranscriptionTests: XCTestCase {
    func testToRNALowerCase() {
        //Arrange
        let input = "attcgagtcg"
        let outputExpected = "UAAGCUCAGC"
        //Act
        let output = toRna(input)
        //Assert
        XCTAssertEqual(output, outputExpected)
    }
    func testToRNAUpperCase() {
        //Arrange
        let input = "ATTCGAGTCG"
        let outputExpected = "UAAGCUCAGC"
        //Act
        let output = toRna(input)
        //Assert
        XCTAssertEqual(output, outputExpected)
    }
    func testToRNAInvalid() {
        //Arrange
        let input = "krxio"
        let outputExpected = ""
        //Act
        let output = toRna(input)
        //Assert
        XCTAssertEqual(output, outputExpected)
    }
    func testToRNAPartInvalid() {
        //Arrange
        let input = "aktrcxgiuo"
        let outputExpected = ""
        //Act
        let output = toRna(input)
        //Assert
        XCTAssertEqual(output, outputExpected)
    }
}
