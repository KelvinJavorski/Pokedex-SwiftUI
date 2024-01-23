import SwiftUI

struct Sample: View {
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink(destination: Text("Details for \(pokemon.name)")) {
                            if self.viewModel.areDetailsLoaded(for: pokemon) {
                                PokemonCardView(pokemon: pokemon)
                                    .onAppear {
                                        if pokemon == self.viewModel.pokemons.last {
                                            self.viewModel.loadMoreData()
                                        }
                                    }
                            } else {
                                ProgressView()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(10)
                                    .padding(8)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .onAppear {
                                        
                                        self.viewModel.loadPokemonDetails(pokemon: pokemon)
                                    }
                                
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Pokemons")
                //            .background(Color(hex:"E0E0E0"))
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                // Adicione ação para o botão de navegação, se necessário
            }) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.blue)
            })
            .onAppear(perform: viewModel.loadData)
            .onDisappear(perform: {
                                self.viewModel.clearLoadedDetails()
                            })
        }
    }
}
extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Sample()
    }
}

struct PokemonCardView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack {
            if let imageUrl = pokemon.imageUrl {
                URLImage(url: imageUrl)
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                //                    .overlay(
                //                        RoundedRectangle(cornerRadius: 10)
                //                            .stroke(Color.black, lineWidth: 1)
                //                    )
            }
            
            
            Text("\(pokemon.name.capitalized)  #\(pokemon.id)")
                .font(.headline)
                .padding(.top, 8)
        }
        .padding(8)
        .background(Color(pokemon.color ?? Color(hex: "FFFFFF")))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


