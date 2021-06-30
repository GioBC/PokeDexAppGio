//
//  Generation_ii.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Generation_ii: Codable {
    
    
    let gold : Gold?
    
    enum CodingKeys: String, CodingKey {
        case gold = "gold"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gold = try values.decodeIfPresent(Gold.self, forKey: .gold)
        
    }
    
}

struct Gold : Codable {
    
    let front_default : String?
    
    enum CodingKeys: String, CodingKey {
        case front_default = "front_default"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
        
    }
    
}
