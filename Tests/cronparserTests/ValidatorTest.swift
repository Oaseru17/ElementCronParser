//
//  ValidatorTest.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import XCTest
@testable import cronparser

final class ValidatorTest: XCTestCase {
    func testHour() throws {
        //Arrange
        let validator = ValidatorImpl()
        
        XCTAssertNil(validator.validateHour(hour: "45"))
        XCTAssertNil(validator.validateHour(hour: ""))
        XCTAssertNil(validator.validateHour(hour: "-6"))
        XCTAssertNil(validator.validateHour(hour: "nm"))
        XCTAssertNil(validator.validateHour(hour: "NM"))
        XCTAssertNil(validator.validateHour(hour: "0800"))
        XCTAssertNil(validator.validateHour(hour: "32"))
        XCTAssertNotNil(validator.validateHour(hour: "12"))
        XCTAssertNotNil(validator.validateHour(hour: "9"))
        XCTAssertNotNil(validator.validateHour(hour: "19"))
        XCTAssertNotNil(validator.validateHour(hour: "17"))
        XCTAssertNotNil(validator.validateHour(hour: "00"))
        XCTAssertNotNil(validator.validateHour(hour: "0"))
    }
    
    func testMinute() throws {
        //Arrange
        let validator = ValidatorImpl()
        
        XCTAssertNil(validator.validateMinute(minute: "-54"))
        XCTAssertNil(validator.validateMinute(minute: "450"))
        XCTAssertNil(validator.validateMinute(minute: ""))
        XCTAssertNil(validator.validateMinute(minute: "554"))
        XCTAssertNil(validator.validateMinute(minute: "66"))
        XCTAssertNil(validator.validateMinute(minute: "545"))
        XCTAssertNil(validator.validateMinute(minute: "er"))
        XCTAssertNil(validator.validateMinute(minute: "RE"))
        XCTAssertNil(validator.validateMinute(minute: "-"))
        XCTAssertNil(validator.validateMinute(minute: "*X"))
        XCTAssertNil(validator.validateMinute(minute: "5"))
        XCTAssertNotNil(validator.validateMinute(minute: "15"))
        XCTAssertNotNil(validator.validateMinute(minute: "55"))
        XCTAssertNotNil(validator.validateMinute(minute: "25"))
        XCTAssertNotNil(validator.validateMinute(minute: "45"))
    }
    
    func testScript() throws {
        //Arrange
        let validator = ValidatorImpl()
        
        XCTAssertNil(validator.validateScript(script: ""))
        XCTAssertNotNil(validator.validateScript(script: "trt"))
        XCTAssertNotNil(validator.validateScript(script: "-Bin"))
    }
    
}
