import XCTest
@testable import cronparser

final class NextRunScheduleTests: XCTestCase {
    func testDescription() throws {
       //Arrange
        let nextRunJob = NextRunSchedule(hour: 9, minute: 12, today: true, script: "Test Script")
        
        // Act
        let description = nextRunJob.description
        
        //Assert
        XCTAssertEqual(description, "09:12 today - Test Script")
    }
}
