//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject private var viewModel: PokemonListViewModel

    init(viewTypePublisher: ViewTypePublisher) {
        _viewModel = StateObject(wrappedValue: PokemonListViewModel(service: PokemonService(), viewTypeSubscriber: viewTypePublisher))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.pokemonList, id: \.id) { pokemon in
                    NavigationLink(destination: PokemonDetailsView(pokemonData: pokemon)) {
                        HStack {
                            AsyncImage(url: URL(string: pokemon.imageURL)) { image in
                                image
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 90, height: 90, alignment: .center)
                                    .foregroundColor(.white)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(pokemon.name)
                                    .font(Font(.init(.system, size: 19)))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                Text(pokemon.description)
                                    .font(Font(.init(.system, size: 15)))
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                .listRowBackground(Color.black)
                .listRowSeparator(.hidden, edges: .all)
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle("Pokemon", displayMode: .inline)
            .toolbarBackground(Color(red: 151/255, green: 124/255, blue: 242/255), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                Button("Switch") {
                    viewModel.switchViewType(.uikit)
                }
            }
            .background(.black)
            .scrollContentBackground(.hidden)
        }
        .listStyle(.plain)
        .task {
            await viewModel.fetchPokemons()
        }
    }
}

//#Preview {
//    PokemonListView()
//}
