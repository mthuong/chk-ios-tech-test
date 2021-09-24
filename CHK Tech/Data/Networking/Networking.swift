//
//  Networking.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation
import Combine

protocol NetworkingProtocol: AnyObject {
    typealias Headers = [String: Any]
    
    func get<T>(type: T.Type,
                url: URL,
                headers: Headers) -> AnyPublisher<T, Error> where T: Decodable
    
    func getData(url: URL, headers: Headers) -> AnyPublisher<Data, URLError>
}

final class Networking: NetworkingProtocol {
    
    func get<T>(type: T.Type,
                url: URL,
                headers: Headers) -> AnyPublisher<T, Error> where T : Decodable {
        
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getData(url: URL, headers: Headers) -> AnyPublisher<Data, URLError> {
        
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, Error> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
//    .mapError { error in
//        .parsing(description: error.localizedDescription)
//    }
    .eraseToAnyPublisher()
}
