//
//  Generation_vii.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Generation_vii: Codable {
    
    let icons : Icons?
    

    enum CodingKeys: String, CodingKey {

        case icons = "icons"
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        icons = try values.decodeIfPresent(Icons.self, forKey: .icons)
    }
}

struct Icons : Codable {
    let front_default : String?
  
    enum CodingKeys: String, CodingKey {
        case front_default = "front_default"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
    }
}
