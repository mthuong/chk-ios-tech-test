//
//  CoinViewViewModelTests.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/26/21.
//

@testable import CHK_Tech
import XCTest

class CoinViewViewModelTests: XCTestCase {
    var viewModel: CoinView.ViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPriceLargerThan1000() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let coin = Coin.fake(buyPrice: "1000.0933", sellPrice: "1000.0933")
        
        viewModel = CoinView.ViewModel(coin: coin, numberFormatter: priceFormatter)
        
        XCTAssertEqual(viewModel.buyPrice, "1,000.09")
        XCTAssertEqual(viewModel.sellPrice, "1,000.09")
    }
    
    func testPriceLessThan1000() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let coin = Coin.fake(buyPrice: "999.5933", sellPrice: "999.5933")
        
        viewModel = CoinView.ViewModel(coin: coin, numberFormatter: priceFormatter)
        
        
        XCTAssertEqual(viewModel.sellPrice, "999.5933")
        XCTAssertEqual(viewModel.buyPrice, "999.5933")
    }
    
    func testPriceNil() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let coin = Coin(
            base: "LTC",
            counter: "USD",
            buyPrice: nil,
            sellPrice: nil,
            icon: "https://cdn.coinhako.com/assets/wallet-ltc-e4ce25a8fb34c45d40165b6f4eecfbca2729c40c20611acd45ea0dc3ab50f8a6.png",
            name: "Litecoin"
        )
        
        viewModel = CoinView.ViewModel(coin: coin, numberFormatter: priceFormatter)
        
        
        XCTAssertEqual(viewModel.sellPrice, "")
        XCTAssertEqual(viewModel.buyPrice, "")
    }
    
    func testPriceInvalid() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let coin = Coin(
            base: "LTC",
            counter: "USD",
            buyPrice: "123.123.123",
            sellPrice: "123.123.123",
            icon: "https://cdn.coinhako.com/assets/wallet-ltc-e4ce25a8fb34c45d40165b6f4eecfbca2729c40c20611acd45ea0dc3ab50f8a6.png",
            name: "Litecoin"
        )
        
        viewModel = CoinView.ViewModel(coin: coin, numberFormatter: priceFormatter)
        
        
        XCTAssertEqual(viewModel.sellPrice, "")
        XCTAssertEqual(viewModel.buyPrice, "")
    }
}
