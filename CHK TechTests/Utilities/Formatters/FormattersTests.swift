//
//  FormattersTests.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/25/21.
//

@testable import CHK_Tech
import XCTest

class FormattersTests: XCTestCase {
    var numberFormatter: NumberFormatter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        numberFormatter = priceFormatter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        numberFormatter = nil
    }

    func testPriceFormatter() throws {
        numberFormatter.string(from: <#T##NSNumber#>)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
