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
            return Color(hex: "C4C3A8")
        case .fire:
            return Color(hex: "F7B396")
        case .water:
            return Color(hex: "91ABE4")
        case .electric:
            return Color(hex: "FAE8A5")
        case .grass:
            return Color(hex: "A4DCA2")
        case .ice:
            return Color(hex: "C8EFEA")
        case .fighting:
            return Color(hex: "E2948E")
        case .poison:
            return Color(hex: "CDAED9")
        case .ground:
            return Color(hex: "EAD7A2")
        case .flying:
            return Color(hex: "C2BBE4")
        case .psychic:
            return Color(hex: "FAB9C6")
        case .bug:
            return Color(hex: "C8DCAA")
        case .rock:
            return Color(hex: "D4C69E")
        case .ghost:
            return Color(hex: "A995C4")
        case .dark:
            return Color(hex: "A6988F")
        case .dragon:
            return Color(hex: "BAAAFD")
        case .steel:
            return Color(hex: "C7C7DA")
        case .fairy:
            return Color(hex: "E3B9D9")
        }
    }
}
