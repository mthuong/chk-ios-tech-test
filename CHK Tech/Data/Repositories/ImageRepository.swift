//
//  ImageRepository.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation
import Combine

protocol ImageRepositoryProtocol: AnyObject {
    var networking: NetworkingProtocol { get }
    
    func getImageData(urlString: String) -> AnyPublisher<Data, Error>
}

final class ImageRepository: ImageRepositoryProtocol {
    let networking: NetworkingProtocol
    
    init(networker: NetworkingProtocol = Networking()) {
        self.networking = networker
    }
    
    enum UserPictureError: Error {
        case dataInvalid
    }
    
    func getImageData(urlString: String) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: urlString) else {
            return Fail<Data, Error>(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return networking.getData(url: url, headers: [:])
            .mapError { _ in UserPictureError.dataInvalid }
            .eraseToAnyPublisher()
    }
}
