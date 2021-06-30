//
//  PokemonListModel.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import Foundation

struct pokemonList: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [pokemonData]
    
}

struct pokemonData: Codable {
    var url:String?
    var name:String
}
