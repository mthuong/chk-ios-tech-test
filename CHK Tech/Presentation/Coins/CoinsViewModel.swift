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
        @Published var search: String = ""
        
        @Published public var coins: [Coin] = [Coin]([])
        
        private var coinsUseCase: CoinsUseCaseProtocol
        private var cancellables = Set<AnyCancellable>()
        
        init(coins: [Coin] = [],
             coinsUseCase: CoinsUseCaseProtocol = CoinsUseCase(coinsRepository: CoinsRepository())) {
            
            self.coins = coins
            self.coinsUseCase = coinsUseCase
        }
        
        public func onAppear() {
            self.getCoins(with: "USD")
        }
        
        private func getCoins(with currency: String) {
            coinsUseCase
                .loadCoins(currency: currency, search: search)
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        print(error)
                    case .finished: break
                    }
                } receiveValue: { [weak self] coins in
                    guard self != nil else { return }
                    
                    if self?.search.isEmpty == false {
                        self?.coins = coins.filter({ (coin: Coin) -> Bool in
                            guard let name = coin.name else {
                                return false
                            }
                            
                            return name.contains(self?.search ?? "")
                        })
                    } else {
                        self?.coins = coins
                    }
                }
                .store(in: &cancellables)
        }
    }
}
