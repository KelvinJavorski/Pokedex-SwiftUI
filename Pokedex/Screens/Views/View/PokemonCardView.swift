////
////  PokemonCardView.swift
////  Pokedex
////
////  Created by Kelvin Javorski Soares on 04/01/24.
////
//
//import Foundation
//import SwiftUI
//
//struct PokemonCardView : View {
//    let pokemon : Pokemon
//    var body: some View {
//        VStack {
//            Image(pokemon.imageName)
//                .resizable()
//                .frame(width: 130, height: 130)
//                
//            Text("\(pokemon.name)")
//                .font(.title2)
//                .fontWeight(.bold)
//                .scaledToFit()
//                .minimumScaleFactor(0.6)
//        }
//        .padding()
//        .background(Color.red)
//        .foregroundColor(.white)
//        .font(.system(size: 20, weight: .bold))
//        .cornerRadius(10)
//    }
//}
