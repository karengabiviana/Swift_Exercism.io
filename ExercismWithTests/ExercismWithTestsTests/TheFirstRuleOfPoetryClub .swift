//
//  TheFirstRuleOfPoetryClub .swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 10/10/23.
//
import Foundation
import XCTest

//A new poetry club has opened in town, and you're thinking of attending. Because there have been incidents in the past, the club has a very specific door policy which you'll need to master, before attempting entry.
//
//There are two doors at the poetry club, both are guarded. In order to gain entry, you'll need to work out the password of that day:

class TheFirstRuleOfPoetryClub {
    //    Task 1
    //    1 - The guard will recite a poem
    //      - You will have to split the poem into individual lines and respond with the appropriate letters.
    //    2 - The guard will tell you all the letters you've responded with at once;
    //      - You need to format the letters as a capitalized word.

    //    For example, one of their favorite writers is Michael Lockwood, who's written the following acrostic poem, which means that the first letter of each sentence form a word:
    //    Stands so high
    //    Huge hooves too
    //    Impatiently waits for
    //    Reins and harness
    //    Eager to leave

    //    When the guard recites the poem, you will split it into individual lines and respond with the first letters of each line, i.e. ["S", "H", "I", "R", "E"].
    //
    //    The guard will then give you the word formed by the array of letters you replied with for you to put into capitalized word form. Finally the password you return is "Shire", and you'll get in.
    func splitOnNewlines(_ poem: String) -> [String] {
        poem.components(separatedBy: "\n")
    }
}

class TheFirstRuleOfPoetryClubTests: XCTestCase {
    let theFirstRuleOfPoetryClubTestsClass = TheFirstRuleOfPoetryClub()

    //Task 1 Tests
    func testSplitOnNewLines() {
        let input = """
                    Stands so high
                    Huge hooves too
                    Impatiently waits for
                    Reins and harness
                    Eager to leave
                    """
        let output = theFirstRuleOfPoetryClubTestsClass.splitOnNewlines(input)
        let outputExpected = ["Stands so high", "Huge hooves too", "Impatiently waits for", "Reins and harness", "Eager to leave"]
        print(output)
        XCTAssertEqual(output, outputExpected)
    }
}
