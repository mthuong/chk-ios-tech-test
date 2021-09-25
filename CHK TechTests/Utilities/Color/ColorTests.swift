//
//  ColorTests.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/25/21.
//

@testable import CHK_Tech
import XCTest
import SwiftUI

class ColorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testARGBHexColorIsCorrect() throws {
        let color = Color(hex: "13101112")
        let expectedRedValue: CGFloat = 16.0, expectedGreenValue: CGFloat = 17.0, expectedBlueValue: CGFloat = 18.0, expectedOpacityValue: CGFloat = 19.0
        
        XCTAssertEqual(round(color.components.red * 255.0), expectedRedValue)
        XCTAssertEqual(round(color.components.green * 255.0), expectedGreenValue)
        XCTAssertEqual(round(color.components.blue * 255.0), expectedBlueValue)
        XCTAssertEqual(round(color.components.opacity * 255.0), expectedOpacityValue)
    }
    
    func testRGB12bitHexColorIsCorrect() throws {
        let color = Color(hex: "123")
        let expectedRedValue: CGFloat = 17.0, expectedGreenValue: CGFloat = 34.0, expectedBlueValue: CGFloat = 51.0, expectedOpacityValue: CGFloat = 255.0
        
        XCTAssertEqual(round(color.components.red * 255.0), expectedRedValue)
        XCTAssertEqual(round(color.components.green * 255.0), expectedGreenValue)
        XCTAssertEqual(round(color.components.blue * 255.0), expectedBlueValue)
        XCTAssertEqual(round(color.components.opacity * 255.0), expectedOpacityValue)
    }
    
    func testRGB24bitHexColorIsCorrect() throws {
        let color = Color(hex: "101112")
        let expectedRedValue: CGFloat = 16.0, expectedGreenValue: CGFloat = 17.0, expectedBlueValue: CGFloat = 18.0, expectedOpacityValue: CGFloat = 255.0
        
        XCTAssertEqual(round(color.components.red * 255.0), expectedRedValue)
        XCTAssertEqual(round(color.components.green * 255.0), expectedGreenValue)
        XCTAssertEqual(round(color.components.blue * 255.0), expectedBlueValue)
        XCTAssertEqual(round(color.components.opacity * 255.0), expectedOpacityValue)
    }

    func testDefaultHexColorIsCorrect() throws {
        let color = Color(hex: "")
        let expectedRedValue: CGFloat = 1.0, expectedGreenValue: CGFloat = 1.0, expectedBlueValue: CGFloat = 0.0, expectedOpacityValue: CGFloat = 1.0
        
        XCTAssertEqual(round(color.components.red * 255.0), expectedRedValue)
        XCTAssertEqual(round(color.components.green * 255.0), expectedGreenValue)
        XCTAssertEqual(round(color.components.blue * 255.0), expectedBlueValue)
        XCTAssertEqual(round(color.components.opacity * 255.0), expectedOpacityValue)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            _ = Color(hex: "101112")
        }
    }

}
