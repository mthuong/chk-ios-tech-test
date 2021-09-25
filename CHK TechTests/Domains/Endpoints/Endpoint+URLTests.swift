//
//  Endpoint+URLTests.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/25/21.
//

@testable import CHK_Tech
import XCTest

class Endpoint_URLTests: XCTestCase {
    var endpoint: Endpoint!
    var path: String!
    var queryItem: URLQueryItem!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        endpoint = nil
        path = nil
        queryItem = nil
    }
    
    func testURLPathCorrect() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        path = "/coin"
        queryItem = URLQueryItem(name: "query_item", value: "value")
        
        endpoint = Endpoint(path: path, queryItems: [
            queryItem
        ])
        
        let expectedValue = "https://www.coinhako.com/api\( path!)?\(queryItem.name)=\( queryItem.value!)"
        
        let absoluteString = endpoint.url.absoluteString
        
        XCTAssertEqual(absoluteString, expectedValue)
    }
}
