//
//  PokemonList.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 11.02.2024.
//

import Foundation

struct PokemonList: Codable {
    let results: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case results
    }
}
