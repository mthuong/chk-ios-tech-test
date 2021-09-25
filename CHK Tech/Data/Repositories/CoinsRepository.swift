//
//  CoinServices.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation
import Combine

final class CoinsRepository: CoinsRepositoryProtocol {
    let networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol = Networking()) {
        self.networking = networking
    }
    
    func getCoins(currency: String) -> AnyPublisher<[Coin], Error> {
        let endpoint = Endpoint.coins(with: currency)
        
        return networking.get(type: Coins.self,
                             url: endpoint.url,
                             headers: endpoint.headers)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
