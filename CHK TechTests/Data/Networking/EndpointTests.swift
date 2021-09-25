//
//  EndpointTests.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/25/21.
//

@testable import CHK_Tech
import XCTest

class EndpointTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDefaultQueryItems() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectedValue = 0
        
        let endpoint = Endpoint(path: "")
        
        XCTAssertEqual(endpoint.queryItems.count, expectedValue)
    }
}
