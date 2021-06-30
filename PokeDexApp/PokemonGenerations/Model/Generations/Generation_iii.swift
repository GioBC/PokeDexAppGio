//
//  Generation_iii.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Generation_iii: Codable {
    
    let emerald : Emerald?
   
    enum CodingKeys: String, CodingKey {
        case emerald = "emerald"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        emerald = try values.decodeIfPresent(Emerald.self, forKey: .emerald)
    }
}

struct Emerald : Codable {
    
    let front_default : String?
   
    enum CodingKeys: String, CodingKey {
        case front_default = "front_default"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
    }
}

