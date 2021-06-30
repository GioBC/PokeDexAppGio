//
//  Generation_iv.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Generation_iv: Codable {
    
    let diamond_pearl : Diamond_pearl?
   
    enum CodingKeys: String, CodingKey {
        case diamond_pearl = "diamond-pearl"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        diamond_pearl = try values.decodeIfPresent(Diamond_pearl.self, forKey: .diamond_pearl)
    }
}

struct Diamond_pearl : Codable {
  
    let front_default : String?

    enum CodingKeys: String, CodingKey {
        case front_default = "front_default"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
    }
}

