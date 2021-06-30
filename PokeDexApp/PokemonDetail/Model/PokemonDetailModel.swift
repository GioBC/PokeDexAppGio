//
//  PokemonDetailModel.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct pokemonDetail: Codable {
    let name: String
    let id: Int
    let order: Int
    let sprites: pokemonSprites
    let stats:[Stats]
    let moves:[Moves]
    let height: Int
    let weight: Int
    let types: [Types]
    let abilities: [Abilities]
    
}

struct Abilities: Codable {
   let ability: PokemonAbilites
   
}


struct PokemonAbilites: Codable {
    let name: String
    let url: String
   
}
struct Types: Codable {
    let slot: Int
    let type: Type
}

struct Type: Codable {
    let name: String
    let url: String
}

struct Moves: Codable {
    let move: Move
   
}

struct Move: Codable {
    let name: String
    let url: String
}

struct pokemonSprites: Codable {
    let front_default: String?
    let front_shiny: String?
    let other: Other?
    let version: Versions?
    
    
    enum CodingKeys: String, CodingKey {

        case front_default = "front_default"
        case front_shiny = "front_shiny"
        case other = "other"
        case version = "versions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
        front_shiny = try values.decodeIfPresent(String.self, forKey: .front_shiny)
        other = try values.decodeIfPresent(Other.self, forKey: .other)
        version = try values.decodeIfPresent(Versions.self, forKey: .version)!
    }
    
}

struct Stats: Codable {
    let base_stat: Int
    let effort: Int
    let stat: nameStat
}

struct nameStat: Codable {
    let name: String
    let url: String
}
