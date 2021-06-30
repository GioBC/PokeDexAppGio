//
//  Generations.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct GenerationsModel: Codable {
    
    let id: Int?
    let name: String?
    let pokemon_species: [PokemonSpecies]?
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case pokemon_species = "pokemon_species"
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        pokemon_species = try values.decodeIfPresent([PokemonSpecies].self, forKey: .pokemon_species)
    }
}

struct Generations: Codable {
    var name:String?
    var url:String
}



struct GenerationOne: Codable {
    var pokemon_species: [PokemonSpecies]?

    enum CodingKeys: String, CodingKey {

        case pokemon_species = "pokemon_species"
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pokemon_species = try values.decodeIfPresent([PokemonSpecies].self, forKey: .pokemon_species)
    }
    
}

struct PokemonSpecies: Codable {
    var name:String?
    var url:String?
    
    enum CodingKeys: String, CodingKey {

        case name = "name"
        case url = "url"
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}
