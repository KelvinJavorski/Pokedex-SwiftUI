//
//  PokemonAboutView.swift
//  Pokedex
//
//  Created by Kelvin Javorski Soares on 11/01/24.
//

import SwiftUI

struct PokemonAboutView : View {
    let pokemon : Pokemon
    
    var body: some View{
        VStack{
            Text(pokemon.name)
                .font(.title)
                .fontWeight(.bold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
            Spacer()
            Image(pokemon.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Spacer()
            PokemonTypeView()
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ")
                .font(.body)
                .padding()
        }
        .padding()
    }
}
