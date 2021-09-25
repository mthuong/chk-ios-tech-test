//
//  CoinViewViewModel.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation
import SwiftUI

extension CoinView {
    class ViewModel: ObservableObject {
        @Published public var coin: Coin
        
        var numberFormatter: NumberFormatter
        
        init(coin: Coin, numberFormatter: NumberFormatter = priceFormatter) {
            self.coin = coin
            self.numberFormatter = priceFormatter
        }
        
        var buyPrice: String {
            guard let price = coin.buyPrice else {
                return ""
            }
            
            guard let number = NumberFormatter().number(from: price) else {
                return ""
            }
            
            if number.intValue > 1000 {
                return priceFormatter.string(from: number) ?? ""
            }
            
            return coin.buyPrice ?? ""
        }
        
        var sellPrice: String {
            guard let price = coin.sellPrice else {
                return ""
            }
            
            guard let number = NumberFormatter().number(from: price) else {
                return ""
            }
            
            if number.intValue > 1000 {
                return priceFormatter.string(from: number) ?? ""
            }
            
            return coin.sellPrice ?? ""
        }
    }
}
