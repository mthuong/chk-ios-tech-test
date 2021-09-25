//
//  Endpoint.swift
//  CHK Tech
//
//  Created by Thuong Nguyen on 9/24/21.
//

import Foundation

struct Endpoint {
    var scheme: String = "https"
    var host: String = "www.coinhako.com"
    var defaultPath = "/api"
    
    var path: String
    var queryItems: [URLQueryItem] = []
}
