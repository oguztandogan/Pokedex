//
//  PokemonListRouter.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import UIKit

protocol PokemonListRouterProtocol {
    func routeToPokemonDetailScreen(_ pokemonData: Pokemon)
}

class PokemonListRouter {
    var viewController: UIViewController?
}

extension PokemonListRouter: PokemonListRouterProtocol {
    
    func routeToPokemonDetailScreen(_ pokemonData: Pokemon) {
        let pokemonDetailsVC = PokemonDetailsModule().createModule()
        pokemonDetailsVC.viewModel.pokemonData = pokemonData
        viewController?.navigationController?.pushViewController(pokemonDetailsVC, animated: true)
    }
}
