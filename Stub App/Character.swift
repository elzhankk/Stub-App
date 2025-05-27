//
//  Character.swift
//  Stub App
//
//  Created by elzhankk on 27.05.2025.
//

import Foundation

struct CharacterResponse: Codable {
    let results: [Character]
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
