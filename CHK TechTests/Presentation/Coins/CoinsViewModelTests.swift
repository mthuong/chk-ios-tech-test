//
//  CoinsViewModelTests.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/25/21.
//

@testable import CHK_Tech
import XCTest
import Combine

class CoinsViewModelTests: XCTestCase {
    var viewModel: CoinsView.ViewModel!
    private var cancellables: Set<AnyCancellable>!

    class CoinsUseCaseMock: CoinsUseCaseProtocol {
        var expectation: XCTestExpectation?
        var error: Error?

        private var coinsRepository: CoinsRepositoryProtocol
        
        init(coinsRepository: CoinsRepositoryProtocol) {
            self.coinsRepository = coinsRepository
        }
        
        func loadCoins(currency: String = "USD", search: String?, _ completion: @escaping ([Coin]) -> Void) -> AnyCancellable {
            return coinsRepository
                .getCoins(currency: currency)
                .replaceError(with: [])
                .sink {
                    completion($0)
                    
                    self.expectation?.fulfill()
                }
        }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cancellables = []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testLoadCoins() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: "load coins")
        
        let useCase = CoinsUseCaseMock(coinsRepository: CoinsRepositoryMock())
        useCase.expectation = expectation
        
        viewModel = CoinsView.ViewModel(coins: [], coinsUseCase: useCase)
        viewModel.search = ""
        
        viewModel.onAppear()
        
        wait(for: [expectation], timeout: 10)
        
        XCTAssertEqual(viewModel.coins.count, 52)
    }
    
    func testLoadCoinsWithSearch() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: "load coins")
        let search = "Bt"
        
        let useCase = CoinsUseCaseMock(coinsRepository: CoinsRepositoryMock())
        useCase.expectation = expectation
        
        viewModel = CoinsView.ViewModel(coins: [], coinsUseCase: useCase)
        viewModel.search = search
        
        viewModel.onAppear()
        
        wait(for: [expectation], timeout: 10)
        
        XCTAssertEqual(viewModel.coins.count, 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
