//
//  CoinsService.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation
import Combine
import SwiftUI

protocol CoinsUseCaseProtocol {
    func loadCoins(currency: String, search: String?, _ completion: @escaping ([Coin]) -> Void)
}

final class CoinsUseCase: CoinsUseCaseProtocol {
    private var disposables = Set<AnyCancellable>()
    private var coinsRepository: CoinsRepositoryProtocol
    
    init(coinsRepository: CoinsRepositoryProtocol) {
        self.coinsRepository = coinsRepository
    }
    
    func loadCoins(currency: String = "USD", search: String?, _ completion: @escaping ([Coin]) -> Void) {
        coinsRepository
            .getCoins(currency: currency)
            .replaceError(with: [])
            .sink {
                completion($0)
            }
            .store(in: &disposables)
    }
}
