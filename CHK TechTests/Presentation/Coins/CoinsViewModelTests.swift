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
        private var expectation: XCTestExpectation
        var error: Error?
        
        private var disposables = Set<AnyCancellable>()
        private var coinsRepository: CoinsRepositoryProtocol
        
        init(coinsRepository: CoinsRepositoryProtocol, expectation: XCTestExpectation) {
            self.coinsRepository = coinsRepository
            self.expectation = expectation
        }
        
        func loadCoins(currency: String = "USD", search: String?, _ completion: @escaping ([Coin]) -> Void) {
            self.coinsRepository
                .getCoins(currency: currency)
                .replaceError(with: [])
                .sink { [weak self] coins in
                    
                    completion(coins)
                    
                    self?.expectation.fulfill()
                }
                .store(in: &disposables)
        }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cancellables = Set<AnyCancellable>()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testLoadCoins() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: #function)
        
        let useCase = CoinsUseCaseMock.init(coinsRepository: CoinsRepositoryMock(), expectation: expectation)
        
        viewModel = CoinsView.ViewModel(coins: [], coinsUseCase: useCase, scheduler: DispatchQueue.init(label: #function))
        
        viewModel.onAppear()
        
        wait(for: [expectation], timeout: 10)
        
        XCTAssertEqual(viewModel.coins.count, 52)
    }
    
    func testLoadCoinsWithSearch() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: #function)
        let search = "Bt"
        
        let useCase = CoinsUseCaseMock.init(coinsRepository: CoinsRepositoryMock(), expectation: expectation)
        
        viewModel = CoinsView.ViewModel(coins: [], coinsUseCase: useCase, scheduler: DispatchQueue.init(label: #function))
        // Input search value
        viewModel.search = search
        
        // Start get data
        viewModel.onAppear()
        
        wait(for: [expectation], timeout: 10)
        
        XCTAssertEqual(viewModel.coins.count, 2)
    }
}
