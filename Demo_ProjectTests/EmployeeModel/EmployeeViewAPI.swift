//
//  Demo_ProjectTests.swift
//  Demo_ProjectTests
//
//  Created by Tradesocio on 26/04/22.
//

import XCTest
@testable import Demo_Project

class EmployeeViewAPI: XCTestCase {

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmployeeAPI() {
        
        let expectation = self.expectation(description: "employeeApI")
        let employeeAPI = EmployeeViewModel()
        employeeAPI.fetchEmployees { (success) in
            XCTAssertTrue(success)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
        
    }
    


    
}
