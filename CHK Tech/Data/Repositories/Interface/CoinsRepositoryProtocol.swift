//
//  CoinsRepositoryProtocol.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/25/21.
//

import Foundation
import Combine

protocol CoinsRepositoryProtocol: AnyObject {
    var networking: NetworkingProtocol { get }
    
    func getCoins(currency: String) -> AnyPublisher<[Coin], Error>
}
