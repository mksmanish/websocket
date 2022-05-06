//
//  Demo_ProjectUITests.swift
//  Demo_ProjectUITests
//
//  Created by Tradesocio on 26/04/22.
//

import XCTest
@testable import Demo_Project

class LoginUITests: XCTestCase {

    func testlebelsValues() {
    
        let app = XCUIApplication()
        app.launch()
        let lblMainHeader = app.staticTexts["lblMainHeader"]
        XCTAssertEqual(lblMainHeader.label, "Enjoy your Life")
        
        let lblDescHeader = app.staticTexts["lblDescHeader"]
        XCTAssertEqual(lblDescHeader.label, "Let your wealth do the work for you.")
        
        let lblWelcome = app.staticTexts["lblWelcome"]
        XCTAssertEqual(lblWelcome.label, "Welcome To Invest Now")
    
  
    }
    
    func testbuttonexits(){

        let app = XCUIApplication()
        app.launch()

        let buttonTryNow = app.buttons.staticTexts["Try Now"]
        XCTAssertEqual(buttonTryNow.label, "Try Now")
        XCTAssertTrue(buttonTryNow.exists)

        let buttonLogin = app.buttons.staticTexts["Login"]
        XCTAssertEqual(buttonLogin.label, "Login")
        XCTAssertTrue(buttonLogin.exists)

        let buttonCreate = app.buttons.staticTexts["Create account"]
        XCTAssertEqual(buttonCreate.label, "Create account")
        XCTAssertTrue(buttonCreate.exists)

    }
    
//    func testbuttonTryNow() {
//
//
//        let storyboard = UIStoryboard(name: "Login", bundle: nil)
//        let sut = storyboard.instantiateInitialViewController() as! LoginViewController
//        sut.loadViewIfNeeded()
//
//        let app = XCUIApplication()
//        app.launch()
//
//        app.buttons["Try Now"].tap()
//        let storybrd = UIStoryboard(name: "Test", bundle: nil)
//        let nextVc = storybrd.instantiateInitialViewController() as! TestViewController
//        XCTAssertEqual(nextVc.lblTesting.text, "Test")
//
//
//    }
//
//    func testbuttonLoginflow() {
//
//        let elementsQuery = XCUIApplication().scrollViews.otherElements
//        elementsQuery.textFields["Email"].tap()
//
//        let passwordTextField = elementsQuery.textFields["Password"]
//        passwordTextField.tap()
//        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//    }
  
}
