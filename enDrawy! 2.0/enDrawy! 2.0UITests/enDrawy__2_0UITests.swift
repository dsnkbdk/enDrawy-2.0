//
//  enDrawy__2_0UITests.swift
//  enDrawy! 2.0UITests
//
//  Created by WENNAN SHI on 4/26/18.
//  Copyright © 2018 WENNAN SHI. All rights reserved.
//

import XCTest

class enDrawy__2_0UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPalette() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["enDrawy! without Login"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        let element2 = element.children(matching: .other).element(boundBy: 1)
        let button = element2.children(matching: .button).matching(identifier: "Button").element(boundBy: 1)
        button.tap()
        
        let button2 = element2.children(matching: .button).matching(identifier: "Button").element(boundBy: 5)
        button2.tap()
        element.children(matching: .other).element(boundBy: 2).children(matching: .button).matching(identifier: "Button").element(boundBy: 0).tap()
        element2.children(matching: .button).matching(identifier: "Button").element(boundBy: 0).tap()
        
        let element3 = element.children(matching: .other).element(boundBy: 0)
        element3.swipeRight()
        button.tap()
        element3.swipeRight()
        element2.children(matching: .button).matching(identifier: "Button").element(boundBy: 2).tap()
        element3.swipeRight()
        element2.children(matching: .button).matching(identifier: "Button").element(boundBy: 3).tap()
        element3.swipeRight()
        element2.children(matching: .button).matching(identifier: "Button").element(boundBy: 4).tap()
        element3.swipeRight()
        button2.tap()
        element3.swipeRight()
    }

    func testShape() {
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["enDrawy! without Login"].tap()
        
        let element3 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        let element = element3.children(matching: .other).element(boundBy: 1)
        let button = element.children(matching: .button).matching(identifier: "Button").element(boundBy: 1)
        button.tap()
        element.children(matching: .button).matching(identifier: "Button").element(boundBy: 0).tap()
        
        let element2 = element3.children(matching: .other).element(boundBy: 0)
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button.tap()
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element.children(matching: .button).matching(identifier: "Button").element(boundBy: 2).tap()
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element.children(matching: .button).matching(identifier: "Button").element(boundBy: 3).tap()
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element.children(matching: .button).matching(identifier: "Button").element(boundBy: 4).tap()
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element.children(matching: .button).matching(identifier: "Button").element(boundBy: 5).tap()
        element2.swipeRight()
    }
    
    func testDelete() {
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["enDrawy! without Login"].tap()
        
        let element3 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        let element = element3.children(matching: .other).element(boundBy: 1)
        let button = element.children(matching: .button).matching(identifier: "Button").element(boundBy: 1)
        button.tap()
        element.children(matching: .button).matching(identifier: "Button").element(boundBy: 0).tap()
        
        let element2 = element3.children(matching: .other).element(boundBy: 0)
        element2.swipeRight()
        button.tap()
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element.children(matching: .button).matching(identifier: "Button").element(boundBy: 2).tap()
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element.children(matching: .button).matching(identifier: "Button").element(boundBy: 3).tap()
        element2/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeDown()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element3.children(matching: .other).element(boundBy: 2).children(matching: .button).matching(identifier: "Button").element(boundBy: 3).tap()
        app.alerts["Notice"].buttons["Delete"].tap()
    }
    
}
