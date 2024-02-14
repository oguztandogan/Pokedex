//
//  PokemonService.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 11.02.2024.
//

protocol PokemonServiceable {
    func getPokemons() async -> Result<[Pokemon], ApiError>
}

struct PokemonService: HTTPClient, PokemonServiceable {
    func getPokemons() async -> Result<[Pokemon], ApiError> {
        return await sendRequest(endpoint: PokemonsEndpoint.pokemonList, responseModel: [Pokemon].self)
    }
}
