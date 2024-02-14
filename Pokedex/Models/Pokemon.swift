//
//  Pokemons.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 11.02.2024.
//

import Foundation

struct Pokemon: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imageURL = "imageUrl"
    }
}
