//
//  Generation_viii.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Generation_viii: Codable {
    
    let icons : Icons?

    enum CodingKeys: String, CodingKey {

        case icons = "icons"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        icons = try values.decodeIfPresent(Icons.self, forKey: .icons)
    }

}
