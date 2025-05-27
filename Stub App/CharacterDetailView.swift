//
//  CharacterDetailView.swift
//  Stub App
//
//  Created by elzhankk on 27.05.2025.
//

import SwiftUI

struct CharacterDetail: Codable {
    let id: Int
    let name: String
    let image: String
    let species: String
    let gender: String
}

struct CharacterDetailView: View {
    let id: Int
    @State private var character: CharacterDetail?

    var body: some View {
        VStack(spacing: 16) {
            if let character = character {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .clipShape(Circle())

                Text(character.name).font(.title)
                Text("Species: \(character.species)")
                Text("Gender: \(character.gender)")
            } else {
                ProgressView()
            }
        }
        .padding()
        .onAppear(perform: fetchDetail)
        .navigationTitle("Details")
    }

    func fetchDetail() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data,
               let decoded = try? JSONDecoder().decode(CharacterDetail.self, from: data) {
                DispatchQueue.main.async {
                    character = decoded
                }
            }
        }.resume()
    }
}
