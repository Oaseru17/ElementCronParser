//
//  ScheduleRepositoryTest.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import XCTest
@testable import cronparser

final class ScheduleRepositoryTest: XCTestCase {

    func testStorage() throws {
       //Arrange
        let storage = ScheduleRepositoryImpl()
        storage.saveSchedule([Job(minute: 1, hour: 2, script: "Test Script"),
                              Job(minute: 1, hour: 4, script: "Test Script2")])
                             
        // Act
        let jobs = storage.fetchSchedule()
        
        //Assert
        XCTAssertEqual(jobs.count, 2)
    }

}
