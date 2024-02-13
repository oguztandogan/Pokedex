//
//  ApiError.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 11.02.2024.
//

import Foundation

enum ApiError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown

    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
