////
////  HomeGridView.swift
////  Pokedex
////
////  Created by Kelvin Javorski Soares on 04/01/24.
////
//
//import SwiftUI
//
//var body: some View {
//    List {
//        ForEach(viewModel.data, id: \.self) { item in
//            Text(item)
//        }
//
//        
//    }
//}
//
//struct HomeGridViewStack: View {
//    
//    @State private var isNight = false
//    @ObservedObject var pokemonViewModel = PokemonViewModel()
//    @StateObject var viewModel = HomeGridViewModel()
//    @State private var searchText = ""
//    @State private var searchIsActive = false
//    
//    var body: some View {
//        ZStack{
//            BackgroundView(isNight: isNight)
//            NavigationStack{
//                Task{
//                    let (data, _) = try await URLSession.shared.data(from: URL(string: ""))
//                }
//                List{
//                    LazyVGrid(columns: viewModel.columns) {
//                        ForEach(filteredPokemons, id: \.id) { pokemon in
//                            PokemonCardView(pokemon: pokemon)
//                                .onTapGesture {
//                                    viewModel.selectedPokemon = pokemon
//                                }
//                        }
//                        
//
//                        .fullScreenCover(isPresented: $viewModel.isShowingDetailView) {
//                            PokemonDetailView(pokemon: viewModel.selectedPokemon ?? MockData.sampleCharmander, isShowingDetailView: $viewModel.isShowingDetailView)
//                            
//                        }
//                        if viewModel.isLoading {
//                            ProgressView()
//                                .onAppear {
//                                    pokemonViewModel.loadMoreData()
//                                }
//                        } else {
//                            Rectangle().foregroundColor(.clear).frame(width: 0, height: 0)
//                                .onAppear {
//                                    pokemonViewModel.loadMoreData()
//                                }
//                        }
//                        
//                    }
//                    .listRowSeparator(.hidden, edges: .all)
//                    .listRowInsets(.init(top: 20, leading: 20, bottom: 20, trailing: 20))
//                    
//                }
//                .listStyle(.plain)
//                
//                .navigationTitle("Pokedex")
//                
//            }
//            .searchable(text: $searchText, isPresented: .constant(true), prompt: "Procure pelo Pokemon...")
//            .scrollContentBackground(.hidden)
//            
//        }
//        
//    }
//    var filteredPokemons: [Pokemon] {
//        if searchText.isEmpty {
//            return MockData.pokemons
//        } else {
//            return MockData.pokemons.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
//        }
//    }
//}
//
//struct BackgroundView: View {
//    
//    var isNight: Bool
//    
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//                                            isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
//        
//        //Simple Gradient
//        ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    HomeGridViewStack()
//}
