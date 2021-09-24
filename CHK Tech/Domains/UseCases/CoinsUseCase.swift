//
//  CoinsService.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation
import Combine

protocol CoinsUseCaseProtocol {
    func loadCoins(currency: String, search: String?) -> AnyPublisher<Coins, Error>
}

final class CoinsUseCase: CoinsUseCaseProtocol {
    private var coinsRepository: CoinsRepositoryProtocol
    
    init(coinsRepository: CoinsRepositoryProtocol) {
        self.coinsRepository = coinsRepository
    }
    
    func loadCoins(currency: String = "USD", search: String?) -> AnyPublisher<Coins, Error>{
        return coinsRepository
            .getCoins(currency: currency)
    }
    
    
}
