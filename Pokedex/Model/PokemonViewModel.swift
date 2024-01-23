import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    var nextURL: String?
    var previousURL: String?
    private var isLoadingData = false
    private var timer: Timer?
    private var isInitialLoad = true
    private var loadedDetails: Set<Int> = Set()
    
    func areDetailsLoaded(for pokemon: Pokemon) -> Bool {
        return loadedDetails.contains(pokemon.id)
    }
    
    func clearLoadedDetails() {
            loadedDetails.removeAll()
        }
    
    func loadData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=30") else {
            return
        }
        load(url: url)
    }
    
    func loadMoreData() {
        guard !isLoadingData, let nextURL = nextURL, let url = URL(string: nextURL) else {
            return
        }
        isLoadingData = true
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            defer {
                self.isLoadingData = false
            }
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                DispatchQueue.main.async {
                    self.addNewPokemons(response.results.sorted { $0.id < $1.id })
                    self.nextURL = response.next
                    response.results.forEach { self.loadPokemonDetails(pokemon: $0) }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    private func load(url: URL) {
        guard !isLoadingData else {
            return
        }
        
        isLoadingData = true
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            defer {
                self.isLoadingData = false
            }
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.pokemons = response.results.sorted { $0.id < $1.id }
                    self.nextURL = response.next
                    self.previousURL = response.previous
                    response.results.forEach { self.loadPokemonDetails(pokemon: $0) }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func loadPokemonDetails(pokemon: Pokemon) {
        guard !areDetailsLoaded(for: pokemon), let url = URL(string: pokemon.url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PokemonDetailResponse.self, from: data)
                
                DispatchQueue.main.async {
                    if let index = self.pokemons.firstIndex(where: { $0.id == pokemon.id }) {
                        self.pokemons[index].sprites = response.sprites
                        self.pokemons[index].types = response.types
                        self.loadedDetails.insert(pokemon.id)
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    private func addNewPokemons(_ newPokemons: [Pokemon]) {
        let batchSize = 10
        var currentIndex = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            guard !self.isLoadingData else { return }
            
            let endIndex = min(currentIndex + batchSize, newPokemons.count)
            let batch = Array(newPokemons[currentIndex..<endIndex])
            
            DispatchQueue.main.async {
                self.pokemons += batch
            }
            
            currentIndex += batchSize
            
            if currentIndex >= newPokemons.count {
                timer.invalidate()
                
                // Todos os detalhes foram carregados, notifica a mudança
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }
        }
    }
}

