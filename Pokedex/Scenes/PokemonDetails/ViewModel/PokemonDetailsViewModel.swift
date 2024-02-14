//
//  PokemonDetailsViewModel.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import Foundation

class PokemonDetailsViewModel: ObservableObject {
    var router: PokemonDetailsRouter?
    var pokemonData: Pokemon?
    
    init(router: PokemonDetailsRouter? = nil,
         pokemonData: Pokemon? = nil) {
        self.router = router
        self.pokemonData = pokemonData
    }
}
