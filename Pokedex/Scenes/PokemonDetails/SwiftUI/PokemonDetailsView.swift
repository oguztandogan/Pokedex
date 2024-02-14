//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Oguz Tandogan on 13.02.2024.
//

import SwiftUI

struct PokemonDetailsView: View {
    var pokemonData: Pokemon

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemonData.imageURL)) { image in
               image
           } placeholder: {
               ProgressView()
                   .frame(width: 90, height: 90, alignment: .center)
                   .foregroundColor(.white)
           }
            Text(pokemonData.description)
                .font(Font(.init(.system, size: 15)))
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 30)
        .background(Color.black)
        .navigationBarTitle(pokemonData.name, displayMode: .inline)
        .toolbarBackground(Color(red: 151/255, green: 124/255, blue: 242/255), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    PokemonDetailsView(
        pokemonData: Pokemon(
            id: 1,
            name: "Pikachu",
            description: "Lorem ipsum",
            imageURL: ""
        )
    )
}
