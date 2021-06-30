//
//  Generation_v.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Generation_v: Codable {
    
    let black_white : Black_white?

    enum CodingKeys: String, CodingKey {
        case black_white = "black-white"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        black_white = try values.decodeIfPresent(Black_white.self, forKey: .black_white)
    }

}

struct Black_white : Codable {

    let front_default : String?
  
    enum CodingKeys: String, CodingKey {
        case front_default = "front_default"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
      
    }

}

