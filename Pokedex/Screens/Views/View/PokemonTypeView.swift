//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Kelvin Javorski Soares on 11/01/24.
//

import SwiftUI

struct PokemonTypeView : View {
    var body: some View {
            Text("Fire")
                .font(.system(size: 16, weight: .medium))
                .frame(width: 50)
                .scaledToFit()
                .foregroundColor(.white)
                .background(Color(.red))
                .cornerRadius(10)
                
        
    }
}
