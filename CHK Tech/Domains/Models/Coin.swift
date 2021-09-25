//
//  Coin.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coin = try? newJSONDecoder().decode(Coin.self, from: jsonData)

import Foundation

// MARK: - Coin
struct Coin: Codable {
    let base: String
    let counter, buyPrice, sellPrice: String?
    let icon: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case base, counter
        case buyPrice = "buy_price"
        case sellPrice = "sell_price"
        case icon, name
    }
}

extension Coin: Identifiable {
    var id: String { base }
}

extension Coin {
    static func fake(buyPrice: String = "30434.093", sellPrice: String = "999.693") -> Self {
        return Coin(
            base: "LTC",
            counter: "USD",
            buyPrice: buyPrice,
            sellPrice: sellPrice,
            icon: "https://cdn.coinhako.com/assets/wallet-ltc-e4ce25a8fb34c45d40165b6f4eecfbca2729c40c20611acd45ea0dc3ab50f8a6.png",
            name: "Litecoin"
        )
    }
}
