//
//  Endpoint+URL.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.defaultPath + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "Accept": "application/json"
        ]
    }
}
