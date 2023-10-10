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

//    Task 1 - Front Door
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

//      Task 2 - Back Door
//      In the back of the club you'll find the most renowned poets, which is like the VIP area. Because this is not for everyone, the back door process is a bit more convoluted.
//
//      1 - The guard will recite a poem;
//          - Again, you will have to split the poem into lines and respond with the appropriate letter but there are sometimes spaces after each sentence that will need to be removed first.
//      2 - The guard will tell you all the letters you've responded with at once:
//          - You need to format the letters as a capitalized word
//      and ask nicely, by appending ", please"
//      For example, the poem mentioned before is also telestich, which means that the last letter of each sentence form a word:
//
//      Stands so high
//      Huge hooves too
//      Impatiently waits for
//      Reins and harness
//      Eager to leave
//      When the guard recites the poem, you will split it into individual lines, strip off any trailing spaces, and respond with the first letters of each line, i.e. ["h", "o", "r", "s", "e"].
//
//      The guard will then give you the word formed by the array of letters you replied with for you to put into capitalized word form and append ", please.". Finally the password you return is "Horse, please.", and you'll get in.

//    Task 3 - Secret Room
//     Inside the back room of the club is another door that leads to the secret room that only the very top poets may enter.
//
//    The guard will recite a poem;
//    Again, you will have to split the poem into lines and respond with the appropriate letter but now the appropriate letter from line number i is the ith letter of the line.
//    The guard will tell you all the letters you've responded with at once:
//    You need to format the letters as a capitalized word
//    You must shout the secret phrase by returning an uppercased string with an exclamation point added to the end.
//    For example, a modified version of the poem mentioned before fits this pattern:
//
//    Stands so high
//    Huge hooves too
//    Impatiently waits for
//    Rider with harness
//    Eager to leave
//    When the guard recites the poem, you will split it into individual lines, strip off any trailing spaces, and respond with the ith letters of each line, i.e. ["S", "u", "p", "e", "r"].
//
//    The guard will then give you the word formed by the array of letters you replied with for you to put into uppercased word form and append "!". Finally the password you return is SUPER!, and you'll get in.
class TheFirstRuleOfPoetryClub {

//    Task 4 - Implement the function splitLines(_:) that takes a String as input and splits it into an array of Strings using newlines as delimiters.
    func splitOnNewlines(_ poem: String) -> [String] {
        poem.components(separatedBy: "\n")
    }
//
    func firstLetter(_ line: String) -> Character {
        line.first ?? " "
    }
}

class TheFirstRuleOfPoetryClubTests: XCTestCase {
    let theFirstRuleOfPoetryClubTestsClass = TheFirstRuleOfPoetryClub()

    //Task 4 Tests
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

    //Task 5 Tests
    func testFirstLetter() {
        let input = "Stands so high"
        let output = theFirstRuleOfPoetryClubTestsClass.firstLetter(input)
        let outputExpected = Character("S")
        print(output)
        XCTAssertEqual(output, outputExpected)
    }

}
