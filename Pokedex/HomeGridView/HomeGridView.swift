////
////  HomeGridView.swift
////  Pokedex
////
////  Created by Kelvin Javorski Soares on 04/01/24.
////
//
//import SwiftUI
//
//struct HomeGridView: View {
//    @StateObject var viewModel = HomeGridViewModel()
//    
//    var body: some View {
//        NavigationView{
//            ZStack{
//                BackgroundView()
//                LazyVGrid(columns: viewModel.columns) {
//                    ForEach(MockData.pokemons) { pokemon in
//                        PokemonCardView(pokemon: pokemon)
//                            .onTapGesture {
//                                viewModel.selectedPokemon = pokemon
//                            }
//                    }
//                }
//                .padding()
//                .navigationTitle("Pokedex")
//                .fullScreenCover(isPresented: $viewModel.isShowingDetailView) {
//                    PokemonDetailView()
//                    
//                }
//            }
//        }
//    }
//}
//
//struct BackgroundView: View {
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    HomeGridView()
//}
