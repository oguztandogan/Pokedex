//
//  PokemonServiceMock.swift
//  PokedexTests
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import Foundation

final class PokemonServiceMock: PokemonServiceable, Mockable {
    func getPokemons() async -> Result<[Pokemon], ApiError> {
        return .success(loadJSON(filename: "pokemons_response", type: [Pokemon].self))
    }
    
}
