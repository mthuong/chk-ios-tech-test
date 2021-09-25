//
//  CoinsRepositoryMock.swift
//  CHK TechTests
//
//  Created by Thuong Nguyen on 9/25/21.
//

import Foundation
import Combine

final class CoinsRepositoryMock: CoinsRepositoryProtocol {
    let networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol = Networking()) {
        self.networking = networking
    }
    
    func getCoins(currency: String) -> AnyPublisher<[Coin], Error> {
        let mockDataFile = "all_prices_for_mobile"
        guard let pathString = Bundle(for: type(of: self)).path(forResource: mockDataFile, ofType: "json") else {
            fatalError("\(mockDataFile).json not found")
        }
        
        let url = URL(fileURLWithPath: pathString)
        
        let endpoint = Endpoint.coins(with: currency)
        return networking.get(type: Coins.self,
                             url: url,
                             headers: endpoint.headers)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
