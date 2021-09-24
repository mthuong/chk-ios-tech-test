//
//  CoinsViewModel.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import SwiftUI
import Combine

extension CoinsView {
    class ViewModel: ObservableObject {
        @Published public var coins: Coins = Coins(data: [])
        
        private var coinsUseCase: CoinsUseCaseProtocol
        private var cancellables = Set<AnyCancellable>()
        
        init(coins: Coins = Coins(data: []),
             coinsUseCase: CoinsUseCaseProtocol = CoinsUseCase(coinsRepository: CoinsRepository())) {
            
            self.coins = coins
            self.coinsUseCase = coinsUseCase
        }
        
        public func onAppear() {
            self.getCoins(with: "USD")
        }
        
        private func getCoins(with currency: String) {
            coinsUseCase
                .loadCoins(currency: currency, search: nil)
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        print(error)
                    case .finished: break
                    }
                } receiveValue: { [weak self] coins in
                    self?.coins = coins
                }
                .store(in: &cancellables)
        }
    }
}
