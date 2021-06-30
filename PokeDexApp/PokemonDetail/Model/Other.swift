//
//  Other.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Other : Codable {
    let dream_world : Dream_world?
    let official_artwork : Official_artwork?

    enum CodingKeys: String, CodingKey {

        case dream_world = "dream_world"
        case official_artwork = "official-artwork"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dream_world = try values.decodeIfPresent(Dream_world.self, forKey: .dream_world)
        official_artwork = try values.decodeIfPresent(Official_artwork.self, forKey: .official_artwork)
    }

}

struct Dream_world : Codable {
    let front_default : String?
    let front_female : String?

    enum CodingKeys: String, CodingKey {

        case front_default = "front_default"
        case front_female = "front_female"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
        front_female = try values.decodeIfPresent(String.self, forKey: .front_female)
    }

}

struct Official_artwork : Codable {
    let front_default : String?

    enum CodingKeys: String, CodingKey {

        case front_default = "front_default"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
    }
}

