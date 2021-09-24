//
//  Endpoint+Users.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation

extension Endpoint {
    
    static func coins(with currency: String = "USD") -> Self {
        return Endpoint(path: "/v3/price/all_prices_for_mobile", queryItems: [
            URLQueryItem(name: "counter_currency", value: currency)
        ])
    }
}
