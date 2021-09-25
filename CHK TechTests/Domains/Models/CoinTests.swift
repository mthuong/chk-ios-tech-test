//
//  CoinTests.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/25/21.
//

@testable import CHK_Tech
import XCTest

class CoinTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoinFullProperties() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let coinFake = Coin.fake(buyPrice: "30434.093", sellPrice: "434.093")
        let base = "LTC",
        counter = "USD",
        buyPrice = "30434.093",
        sellPrice = "434.093",
        icon = "https://cdn.coinhako.com/assets/wallet-ltc-e4ce25a8fb34c45d40165b6f4eecfbca2729c40c20611acd45ea0dc3ab50f8a6.png",
        name = "Litecoin"
        
        XCTAssertEqual(coinFake.base, base)
        XCTAssertEqual(coinFake.counter, counter)
        XCTAssertEqual(coinFake.buyPrice, buyPrice)
        XCTAssertEqual(coinFake.sellPrice, sellPrice)
        XCTAssertEqual(coinFake.icon, icon)
        XCTAssertEqual(coinFake.name, name)
        XCTAssertEqual(coinFake.id, base)
    }
}
