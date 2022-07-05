//
//  CronParserTest.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import XCTest
@testable import cronparser

final class CronParserTests: XCTestCase {
    func testSuccessfulParsing() throws {
       //Arrange
        let parse = CronParserImpl()
    
        let dialyResult = parse.parseString(value: "30 1 /bin/run_me_daily")
        XCTAssertEqual(dialyResult[0].hour, 1)
        XCTAssertEqual(dialyResult[0].minute, 30)
        XCTAssertEqual(dialyResult[0].script, "/bin/run_me_daily")
        
        let hourResult = parse.parseString(value: "45 * /bin/run_me_hour")
        XCTAssertEqual(hourResult[0].hour, -1)
        XCTAssertEqual(hourResult[0].minute, 45)
        XCTAssertEqual(hourResult[0].script, "/bin/run_me_hour")
        
        
        let minuteResult = parse.parseString(value: "* * /bin/run_me_min")
        XCTAssertEqual(minuteResult[0].hour, -1)
        XCTAssertEqual(minuteResult[0].minute, -1)
        XCTAssertEqual(minuteResult[0].script, "/bin/run_me_min")
        
        let timesResult = parse.parseString(value: "* 19 /bin/run_me_times")
        XCTAssertEqual(timesResult[0].hour, 19)
        XCTAssertEqual(timesResult[0].minute, -1)
        XCTAssertEqual(timesResult[0].script, "/bin/run_me_times")
    }
    
    func testFailedParsing() throws {
       //Arrange
        let parse = CronParserImpl()
    
        let test1 = parse.parseString(value: "30 1")
        XCTAssertEqual(test1.count, 0)
        
        let test2 = parse.parseString(value: "^^ hj &*")
        XCTAssertEqual(test2.count, 0)
        
        let test3 = parse.parseString(value: "      hj &*")
        XCTAssertEqual(test3.count, 0)
    }
}
