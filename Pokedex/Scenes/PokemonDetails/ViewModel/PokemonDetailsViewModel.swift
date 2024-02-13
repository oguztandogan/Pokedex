//
//  PokemonDetailsViewModel.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import Foundation

class PokemonDetailsViewModel {
    var router: PokemonDetailsRouter
    var pokemonData: Pokemon?
    
    init(router: PokemonDetailsRouter, pokemonData: Pokemon? = nil) {
        self.router = router
        self.pokemonData = pokemonData
    }
    
//    init(pokemonData: Pokemon) {
//        self.pokemonData = pokemonData
//    }
}
