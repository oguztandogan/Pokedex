//
//  EndpointProvider.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 11.02.2024.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var queries: [URLQueryItem]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "gist.githubusercontent.com"
    }
}
