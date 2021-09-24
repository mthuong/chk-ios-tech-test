//
//  CoinsRouter.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation
import SwiftUI

extension CoinsView {
    final class Router {
        public static func destinationForTappedCoin(coin: Coin) -> some View {
            return CoinDetails()
        }
    }
}
