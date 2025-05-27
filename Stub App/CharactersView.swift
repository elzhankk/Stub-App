//
//  CharactersView.swift
//  Stub App
//
//  Created by elzhankk on 27.05.2025.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                NavigationLink(destination: CharacterDetailView(id: character.id)) {
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                        Text(character.name)
                    }
                }
            }
            .navigationTitle("Characters")
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}
