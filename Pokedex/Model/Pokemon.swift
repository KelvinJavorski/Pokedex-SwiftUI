//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kelvin Javorski Soares on 04/01/24.
//

import Foundation
import SwiftUI

struct Pokemon: Codable, Identifiable, Hashable, Equatable {
    let name: String
    var sprites: PokemonSprites?
    let url: String
    var types: [TypeElement]?

    var color: Color? {
         guard let mainType = types?.first?.type.name else {
             // Se não houver tipo, retorne uma cor padrão ou nil, conforme apropriado para sua aplicação
             return nil
         }
         return PokemonType(rawValue: mainType)?.color
     }
    
    var id: Int {
        guard let idString = url.split(separator: "/").last, let id = Int(idString) else {
            return 0
        }
        return id
    }
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
    
    var imageUrl: String? {
        return sprites?.frontDefault ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
}

struct PokemonListResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct PokemonDetailResponse: Codable {
    let sprites: PokemonSprites
    let types: [TypeElement]
}

struct PokemonSprites: Codable, Hashable {
    let frontDefault: String?
    // Pode haver mais URLs para outras versões da imagem
}

struct TypeElement: Codable {
    let slot: Int?
    let type: Species
}

struct Species: Codable {
    let name: String
    let url: String
}
