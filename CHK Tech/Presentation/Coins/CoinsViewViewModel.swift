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
    private var originalCoins: [Coin] = [Coin]([])
    
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
            .debounce(for: .seconds(0.3), scheduler: scheduler)
            .sink(receiveValue: { [weak self] (search: String) in
                print("$search")
                self?.searchCoins(search)
            })
            .store(in: &cancellables)
        
        Timer.publish(every: 30, on: .current, in: .common)
            .autoconnect()
            .receive(on: scheduler)
            .sink { [weak self] (_) in
                print("getCoins 30s")
                self?.getCoins(with: "USD")
            }
            .store(in: &cancellables)
    }
    
    public func onAppear() {
        return getCoins(with: "USD")
    }
    
    private func searchCoins(_ search: String?) {
        var results: [Coin]
        if self.search.isEmpty == false {
            results = originalCoins.filter({ (coin: Coin) -> Bool in
                return coin.base.uppercased().contains(self.search.uppercased())
            })
        } else {
            results = originalCoins
        }
        
        DispatchQueue.main.sync {
            self.coins = results
        }
    }
    
    private func getCoins(with currency: String) {
        return coinsUseCase
            .loadCoins(currency: currency, search: search, { [weak self] (coins: [Coin]) in
                guard let self = self else { return }
                
                self.originalCoins = coins
                
                self.searchCoins(self.search)
            })
    }
}
}
