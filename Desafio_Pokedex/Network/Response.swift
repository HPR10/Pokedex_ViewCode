//
//  Response.swift
//  Desafio_Pokedex
//
//  Created by Hugo Pinheiro on 03/01/22.
//

import Foundation

enum PokedexResponse
{
    case success(model: PokedexModel)
    case serverError(description: ServerError)
    case timeOut(description: ServerError)
    case noConnection(description: ServerError)
    case invalidResponse
}

enum PokemonResponse
{
    case success(model: PokemonModel)
    case serverError(description: ServerError)
    case timeOut(description: ServerError)
    case noConnection(description: ServerError)
    case invalidResponse
}

enum ImageResponse
{
    case success(model: Data)
    case serverError(description: ServerError)
    case timeOut(description: ServerError)
    case noConnection(description: ServerError)
    case invalidResponse
}
