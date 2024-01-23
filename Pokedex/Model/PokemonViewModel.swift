import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    var nextURL: String?
    var previousURL: String?
    private var isLoadingData = false
    private var timer: Timer?

    // Método para carregar dados da API
    func loadData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=30") else {
            return
        }

        load(url: url)
    }

    // Método para carregar mais dados
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
                    for pokemon in response.results {
                                        self.loadPokemonDetails(pokemon: pokemon)
                                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }

    // Método genérico para carregar dados da API
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
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func loadPokemonDetails(pokemon: Pokemon) {
            guard let url = URL(string: pokemon.url) else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                // Código a ser executado quando a tarefa de sessão for concluída
                guard let data = data, error == nil else {
                    return
                }

                do {
                    // Tenta decodificar os dados obtidos em uma instância de PokemonDetailResponse
                    let response = try JSONDecoder().decode(PokemonDetailResponse.self, from: data)

                    DispatchQueue.main.async {
                        // Atualiza os detalhes do Pokémon no array existente
                        if let index = self.pokemons.firstIndex(where: { $0.id == pokemon.id }) {
                            self.pokemons[index].sprites = response.sprites
                            self.pokemons[index].types = response.types
                        }
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }.resume()
        }

    // Método para adicionar novos Pokémon gradualmente usando um temporizador
    private func addNewPokemons(_ newPokemons: [Pokemon]) {
        let batchSize = 10 // Número de Pokémon a serem adicionados de cada vez
        var currentIndex = 0

        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            let endIndex = min(currentIndex + batchSize, newPokemons.count)
            let batch = Array(newPokemons[currentIndex..<endIndex])

            DispatchQueue.main.async {
                self.pokemons += batch
            }

            currentIndex += batchSize

            if currentIndex >= newPokemons.count {
                timer.invalidate()
            }
        }
    }
}
