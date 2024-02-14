//
//  PokemonListModule.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import UIKit

class PokemonListModule {
    
    func createModule(viewTypeSubscriber: ViewTypePublisher) -> UIViewController {
        let viewController = PokemonListViewController(nibName: "PokemonListViewController", bundle: nil)
        viewController.viewModel = PokemonListViewModel(router: PokemonListRouter(), service: PokemonService(), viewTypeSubscriber: viewTypeSubscriber)
        viewController.viewModel.router?.viewController = viewController
        return viewController
    }
}
