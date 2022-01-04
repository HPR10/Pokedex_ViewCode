import Foundation

struct PokemonModel: Codable {
    
    let id: Int
    let name: String
    let urlImage: String
    
  
}

struct pokemonData: Codable {
    let name: String
    let url: String
}
