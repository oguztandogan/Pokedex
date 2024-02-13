//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 9.02.2024.
//

import Foundation
import Combine

final class PokemonListViewModel: ObservableObject {
    var router: PokemonListRouter!
    var service: PokemonServiceable
    
    init(router: PokemonListRouter,
         service: PokemonServiceable) {
        self.router = router
        self.service = service
    }
    
    @Published var pokemonList: [Pokemon] = []
    @Published var pokemonError: ApiError?
    private var cancellables: Set<AnyCancellable> = []
    
    func onAppear() {
        fetchPokemons()
    }
    
    func fetchPokemons() {
        Task(priority: .background) {
            let result = await service.getPokemons()
            switch result {
            case .success(let usersResponse):
                pokemonList = usersResponse
            case .failure(let error):
                print(error)
            }
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
        router.routeToPokemonDetailScreen(pokemonList[index])
    }
}
