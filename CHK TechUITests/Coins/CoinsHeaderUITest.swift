//
//  CoinsHeaderUITest.swift
//  CHK TechUITests
//
//  Created by Thuong Nguyen on 9/26/21.
//

import XCTest

class CoinsHeaderUITest: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        continueAfterFailure = false
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoinsHeader() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pairsLabel = app.staticTexts["PAIRS"]
        let priceLabel = app.staticTexts["PRICE"]
        
        XCTAssertTrue(pairsLabel.exists)
        XCTAssertTrue(priceLabel.exists)
    }

}
