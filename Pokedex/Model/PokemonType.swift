//
//  PokemonType.swift
//  Pokedex
//
//  Created by Kelvin Javorski Soares on 23/01/24.
//

import Foundation
import SwiftUI

enum PokemonType: String, Codable, CaseIterable {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dark
    case dragon
    case steel
    case fairy

    var color: Color {
        switch self {
        case .normal:
            return Color(hex: "A8A77A")
        case .fire:
            return Color(hex: "EE8130")
        case .water:
            return Color(hex: "6390F0")
        case .electric:
            return Color(hex: "F7D02C")
        case .grass:
            return Color(hex: "7AC74C")
        case .ice:
            return Color(hex: "96D9D6")
        case .fighting:
            return Color(hex: "C22E28")
        case .poison:
            return Color(hex: "A33EA1")
        case .ground:
            return Color(hex: "E2BF65")
        case .flying:
            return Color(hex: "A98FF3")
        case .psychic:
            return Color(hex: "F95587")
        case .bug:
            return Color(hex: "A6B91A")
        case .rock:
            return Color(hex: "B6A136")
        case .ghost:
            return Color(hex: "735797")
        case .dark:
            return Color(hex: "705746")
        case .dragon:
            return Color(hex: "6F35FC")
        case .steel:
            return Color(hex: "B7B7CE")
        case .fairy:
            return Color(hex: "D685AD")
        }
    }
}
