//
//  LoginAPI.swift
//  Demo_ProjectTests
//
//  Created by Tradesocio on 05/05/22.
//

import XCTest
@testable import Demo_Project

class LoginAPI: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginAPI() {
        
        let expectation = self.expectation(description: "LoginApI")
        let LoginModel = LoginViewModel()
        LoginModel.LoginIn { (result,success) in
            XCTAssertNotNil(result)
            XCTAssertTrue(success)
            XCTAssertEqual(result.message, "Success")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    
}

 
