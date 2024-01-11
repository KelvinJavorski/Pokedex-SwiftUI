//
//  HomeGridViewModel.swift
//  Pokedex
//
//  Created by Kelvin Javorski Soares on 04/01/24.
//

import Foundation
import SwiftUI

final class HomeGridViewModel: ObservableObject {
    
    var selectedPokemon: Pokemon? {
        didSet { isShowingDetailView = true }
    }
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())
    ]
}
