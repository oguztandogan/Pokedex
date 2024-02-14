//
//  PokemonListTests.swift
//  PokedexTests
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import Foundation
import XCTest
@testable import Pokedex

class PokemonListTests: XCTestCase {

    var viewModel: PokemonListViewModel!

    override func setUp() {
        super.setUp()
        let pokemonServiceMock = PokemonServiceMock()
        viewModel = PokemonListViewModel(service: pokemonServiceMock, viewTypeSubscriber: ViewTypePublisher())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    func testOnAppear() async {
        await viewModel.fetchPokemons()
        XCTAssertEqual(viewModel.pokemonList.count, 10)
    }

    func testFetchUsers() async {
        let expectation = XCTestExpectation(description: "Fetch Users")
        await viewModel.fetchPokemons()

        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 5)
        XCTAssertEqual(viewModel.pokemonList[0].name, "Bulbasaur")
    }
}
