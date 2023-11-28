//
//  LogLines.swift
//  ExercismWithTestsTests
//
//  Created by Karen Oliveira on 06/11/23.
//

import XCTest

//Instructions
//In this exercise you'll be processing log-lines.
//
//Each log line is a string formatted as follows: "[<LVL>]: <MESSAGE>".
//
//These are the different log levels:
//
//TRC (trace)
//DBG (debug)
//INF (info)
//WRN (warning)
//ERR (error)
//FTL (fatal)
//You have three tasks, each of which need to be completed to provide the necessary functionality.

//Task 1
//Define a LogLevel enum that has six cases corresponding to the above log levels, plus an unknown case for levels with missing or non-standard log levels.
//
//trace
//debug
//info
//warning
//error
//fatal
//unknown
enum LogLevel: Int {
    case trace = 0
    case debug = 1
    case info = 4
    case warning = 5
    case error = 6
    case fatal = 7
    case unknown = 42

    //Task 2
    //Next, implement the LogLevel initializer to parse the log level of a log line:
    //LogLevel("[INF]: File deleted")
    // // => LogLevel.info
    //LogLevel("Something went wrong!")
    // // => LogLevel.unknown
    init?(_ input: String) {
        let logLevel = input.split(separator: ":").dropLast()

        switch(logLevel.first) {
        case "[TRC]":
            self = .trace
        case "[DBG]":
            self = .debug
        case "[INF]":
            self = .info
        case "[WRN]":
            self = .warning
        case "[ERR]":
            self = .error
        case "[FTL]":
            self = .fatal
        default:
            self = .unknown
            break
        }
    }
    //Task 3
    func shortFormat(message: String) -> String {

        switch(self) {
        case .trace:
            return "0:" + message
        case .debug:
            return "1:" + message
        case .info:
            return "4:" + message
        case .warning:
            return "5:" + message
        case .error:
            return "6:" + message
        case .fatal:
            return "7:" + message
        case .unknown:
            return "42:" + message
        }
    }
}

class LogLinesTests: XCTestCase {
    func testInitTrace() {
        let line = "[TRC]: Line 84 - Console.WriteLine('Hello World');"
        XCTAssertEqual(LogLevel(line), LogLevel.trace)
    }
    func testInitDebug() {
        let line = "[DBG]: ; expected"
        XCTAssertEqual(LogLevel(line), LogLevel.debug)
    }
    func testInitWarning() {
        let line = "[WRN]: Timezone not set"
        XCTAssertEqual(LogLevel(line), LogLevel.warning)
    }
    func testInitError() {
        let line = "[ERR]: Disk full"
        XCTAssertEqual(LogLevel(line), LogLevel.error)
    }
    func testInitFatal() {
        let line = "[FTL]: Not enough memory"
        XCTAssertEqual(LogLevel(line), LogLevel.fatal)
    }
    func testInitUnknownEmpty() {
        let line = "Something terrible has happened!"
        XCTAssertEqual(LogLevel(line), LogLevel.unknown)
    }
    func testInitUnknownNonStandard() {
        let line = "[XYZ]: Gibberish message.. beep boop.."
        XCTAssertEqual(LogLevel(line), LogLevel.unknown)
    }
}
