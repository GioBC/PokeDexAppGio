//
//  Generation_vi.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Generation_vi: Codable {
    
    let x_y : X_y?

    enum CodingKeys: String, CodingKey {

        case x_y = "x-y"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        x_y = try values.decodeIfPresent(X_y.self, forKey: .x_y)
    }

}

struct Omegaruby_alphasapphire : Codable {
    let front_default : String?
  

    enum CodingKeys: String, CodingKey {
        case front_default = "front_default"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
      
    }

}

struct X_y : Codable {
    let front_default : String?

    enum CodingKeys: String, CodingKey {

        case front_default = "front_default"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
    }

}

