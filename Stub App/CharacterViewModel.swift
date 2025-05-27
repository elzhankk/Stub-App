//
//  CharacterViewModel.swift
//  Stub App
//
//  Created by elzhankk on 27.05.2025.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []

    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.characters = decoded.results
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
}
