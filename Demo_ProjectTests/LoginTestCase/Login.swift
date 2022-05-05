//
//  Login.swift
//  Demo_ProjectTests
//
//  Created by Tradesocio on 05/05/22.
//

import XCTest
@testable import Demo_Project

class Login: XCTestCase {

 
    var sut = userModel(params: ["userEmail":"manish123kumarr79@gmail.com","password":"Trade@123"])
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserModelCreateNewInstance() {
       
        XCTAssertNotNil(sut)
     }
    
    func testUserModelValidUserMailCount() {
     
        XCTAssertTrue(sut.isValidCount())
     }
    
    func testUserModelValidEmail() {
      
        XCTAssertTrue(sut.isValidUserEmail())
    }
    
    func testUsermodelPasswordCount() {
        XCTAssertTrue(sut.isPasswordCount())
    }
    
    func testSecureEntry() {
        var params = [String:Any]()
        params["userEmail"] = "manish123kumarr79@gmail.com"
        params["password"] = "••••••••••"
        let checck = userModel(params: params)
        XCTAssertTrue(checck.isPasswordSecure())
    }
    
    
    
    func testisValidCreds() {
        var params = [String:Any]()
        params["userEmail"] = "1stdec21@mailinator.com"
        params["password"] = "Trade@123"
        let checck = userModel(params: params)
        XCTAssertTrue(checck.isvalidCreds())
    }
    
    
}
