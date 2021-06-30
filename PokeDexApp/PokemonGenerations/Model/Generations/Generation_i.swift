//
//  GenerationI.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Generation_i : Codable {
    
    let red_blue : Red_blue?
    
    enum CodingKeys: String, CodingKey {
        case red_blue = "red-blue"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        red_blue = try values.decodeIfPresent(Red_blue.self, forKey: .red_blue)
    }
    
}

struct Red_blue : Codable {
    
    let front_default : String?
    
    enum CodingKeys: String, CodingKey {
        case front_default = "front_default"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
        
    }
    
}

