//
//  PokemonsEndpoint.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 11.02.2024.
//

import Foundation

enum PokemonsEndpoint {
    case pokemonList
}

extension PokemonsEndpoint: Endpoint {
    var path: String {
        switch self {
        case .pokemonList:
            return "/DavidCorrado/8912aa29d7c4a5fbf03993b32916d601/raw/"
        }
    }

    var method: RequestMethod {
        switch self {
        case .pokemonList:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .pokemonList:
            return [
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }

    var queries: [URLQueryItem]? {
        switch self {
        case .pokemonList:
            return nil
        }
    }

    var body: [String: String]? {
        switch self {
        case .pokemonList:
            return nil
        }
    }
}
