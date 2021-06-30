//
//  Versions.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation

struct Versions : Codable {
    let generation_i : Generation_i?
    let generation_ii : Generation_ii?
    let generation_iii : Generation_iii?
    let generation_iv : Generation_iv?
    let generation_v : Generation_v?
    let generation_vi : Generation_vi?
    let generation_vii : Generation_vii?
    let generation_viii : Generation_viii?
  

    enum CodingKeys: String, CodingKey {
        case generation_i = "generation-i"
        case generation_ii = "generation-ii"
        case generation_iii = "generation-iii"
        case generation_iv = "generation-iv"
        case generation_v = "generation-v"
        case generation_vi = "generation-vi"
        case generation_vii = "generation-vii"
        case generation_viii = "generation-viii"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        generation_i = try values.decodeIfPresent(Generation_i.self, forKey: .generation_i)
        generation_ii = try values.decodeIfPresent(Generation_ii.self, forKey: .generation_ii)
        generation_iii = try values.decodeIfPresent(Generation_iii.self, forKey: .generation_iii)
        generation_iv = try values.decodeIfPresent(Generation_iv.self, forKey: .generation_iv)
        generation_v = try values.decodeIfPresent(Generation_v.self, forKey: .generation_v)
        generation_vi = try values.decodeIfPresent(Generation_vi.self, forKey: .generation_vi)
        generation_vii = try values.decodeIfPresent(Generation_vii.self, forKey: .generation_vii)
        generation_viii = try values.decodeIfPresent(Generation_viii.self, forKey: .generation_viii)
    }

}

