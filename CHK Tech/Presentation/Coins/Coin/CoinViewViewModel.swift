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
        
        init(coin: Coin) {
            self.coin = coin
        }
        
        var buyPrice: String {
            
            return ""
        }
    }
}
