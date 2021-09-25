//
//  ImageLoaderTests.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/26/21.
//

@testable import CHK_Tech
import XCTest

class ImageLoaderTests: XCTestCase {
    class ClassUnderTest: ImageLoader {
        var deinitCalled: (() -> Void)?
        deinit { deinitCalled?() }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDeinit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var imageLoader: ClassUnderTest? = ClassUnderTest(url: URL(string: ""))
        
        let expectation = self.expectation(description: #function)
        
        imageLoader?.deinitCalled = {
            expectation.fulfill()
        }
        
        DispatchQueue.global(qos: .background).async {
            imageLoader = nil
        }
        
        waitForExpectations(timeout: 2)
    }
    
}
