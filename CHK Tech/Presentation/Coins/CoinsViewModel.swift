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
             coinsUseCase: CoinsUseCaseProtocol = CoinsUseCase(coinsRepository: CoinsRepository()),
             scheduler: DispatchQueue = DispatchQueue(label: "FetchDataViewModel")
        ) {
            
            self.coins = coins
            self.coinsUseCase = coinsUseCase
            
            $search
                .dropFirst(1)
                .debounce(for: .seconds(0.5), scheduler: scheduler)
                .sink(receiveValue: { [weak self] (_) in
                    self?.getCoins(with: "USD")
                })
                .store(in: &cancellables)
            
            Timer.publish(every: 30, on: .current, in: .common)
                .autoconnect()
                .receive(on: scheduler)
                .sink { [weak self] (_) in
                    self?.getCoins(with: "USD")
                }
                .store(in: &cancellables)
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
                            return coin.base.uppercased().contains(self?.search.uppercased() ?? "")
                        })
                    } else {
                        self?.coins = coins
                    }
                }
                .store(in: &cancellables)
        }
    }
}
