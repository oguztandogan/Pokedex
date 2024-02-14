//
//  PokemonDetailsRouter.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import UIKit

class PokemonDetailsModule {

    func createModule() -> PokemonDetailsViewController {
        let detailsViewController = PokemonDetailsViewController(nibName: "PokemonDetailsViewController", bundle: nil)
        detailsViewController.viewModel = PokemonDetailsViewModel(router: PokemonDetailsRouter())
        detailsViewController.viewModel.router?.viewController = detailsViewController
        return detailsViewController
    }
}

protocol PokemonDetailsRouterProtocol {
    func goBack()
}

class PokemonDetailsRouter {
    var viewController: UIViewController?
}

extension PokemonDetailsRouter: PokemonDetailsRouterProtocol {
    func goBack() {}
}
