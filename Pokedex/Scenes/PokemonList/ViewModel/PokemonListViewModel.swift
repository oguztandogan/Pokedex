//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 9.02.2024.
//

import Foundation
import Combine

final class PokemonListViewModel: ObservableObject {
    var router: PokemonListRouter?
    var service: PokemonServiceable
    var viewTypeSubscriber: ViewTypePublisher
    
    init(router: PokemonListRouter? = nil,
         service: PokemonServiceable,
         viewTypeSubscriber: ViewTypePublisher) {
        self.router = router
        self.service = service
        self.viewTypeSubscriber = viewTypeSubscriber
    }
    
    @Published var pokemonList: [Pokemon] = []
    @Published var pokemonError: ApiError?
    private var cancellables: Set<AnyCancellable> = []

    @MainActor
    func fetchPokemons() async {
        let result = await service.getPokemons()
        switch result {
        case .success(let usersResponse):
            pokemonList = usersResponse
        case .failure(let error):
            print(error)
        }
    }
    
    func setData(index: Int) -> PokemonListTableViewCellData {
        let cellData = PokemonListTableViewCellData(
            imageUrl: pokemonList[index].imageURL,
            title: pokemonList[index].name,
            description: pokemonList[index].description
        )
        return cellData
    }
    
    func navigateToPokemonDetails(index: Int) {
        router?.routeToPokemonDetailScreen(pokemonList[index])
    }
    
    func switchViewType(_ viewType: ViewType) {
        viewTypeSubscriber.viewTypeSubject.send(viewType)
    }
}
