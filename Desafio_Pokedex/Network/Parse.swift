//
//  Parser.swift
//  Desafio_Pokedex
//
//  Created by Hugo Pinheiro on 03/01/22.
//

import Foundation


//typealias ParseReponseDict = [String: Any]
//typealias PokemonSpriteDict = [String: Any]

class ParsePokedex
{
    func parseAllPokedex(response: [String: Any]) -> PokedexModel?
    {
        guard let count = response["count"] as? Int,
            let resultsList = response["results"] as? [[String: Any]] //Pego a lista de resultado
        else {
            return nil
        }
        
        let next = response["next"] as? String ?? ""
        let previus = response["previous"] as? String ?? ""
        let results = resultsList.count
        
        return PokedexModel(count: count, next: next, previous: previus, results: results)
    }
    
    func parsePokemon(response: [String: Any]) -> PokemonModel?
    {
        guard let name = response["name"] as? String,
            let id = response["id"] as? Int,
            let sprites = response["sprites"] as? [String: Any],
            let urlImage = sprites["front_default"] as? String
        else {
            return nil
        }
        
        return PokemonModel(id: id, name: name, urlImage: urlImage)
    }
}
