//
//  Endpoint+CoinsTests.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/25/21.
//

@testable import CHK_Tech
import XCTest

class Endpoint_CoinsTests: XCTestCase {
    var endpoint: Endpoint!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        endpoint = nil
    }
    
    func testCoinsEndPointCorrect() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        endpoint = Endpoint.coins()
        
        let expectedValue = "https://www.coinhako.com/api/v3/price/all_prices_for_mobile?counter_currency=USD"
        
        let absoluteString = endpoint.url.absoluteString
        
        XCTAssertEqual(absoluteString, expectedValue)
    }

    func testCoinsEndPointWithCurrencyCorrect() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let currency = "SGD"
        
        endpoint = Endpoint.coins(with: currency)
        
        let expectedValue = "https://www.coinhako.com/api/v3/price/all_prices_for_mobile?counter_currency=\(currency)"
        
        let absoluteString = endpoint.url.absoluteString
        
        XCTAssertEqual(absoluteString, expectedValue)
    }
}
