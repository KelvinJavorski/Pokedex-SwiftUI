//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kelvin Javorski Soares on 04/01/24.
//

import Foundation

struct Pokemon: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
}

struct MockData {
    static let sampleCharmander = Pokemon(name: "Charmander", imageName: "charmander")
    static let sampleCharmander2 = Pokemon(name: "Bulbassaur", imageName: "charmander")
    static let sampleCharmander3 = Pokemon(name: "Squirtle", imageName: "charmander")
    static let sampleCharmander4 = Pokemon(name: "Pikachu", imageName: "charmander")
    static let sampleCharmander5 = Pokemon(name: "Charizard", imageName: "charmander")
    
    static let pokemons = [sampleCharmander, sampleCharmander2, sampleCharmander3, sampleCharmander4, sampleCharmander5]
}
