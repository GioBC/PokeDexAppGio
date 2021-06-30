//
//  PokemonRandomViewModel.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 29/06/21.
//

import Foundation

class PokemonRandomViewModel {

    func getRandomPokemon(id: Int,completionHandler: @escaping (pokemonDetail?) -> Void)
        {
            APIRepository.getRandomPokemon(id: id ) { (     pokemonDetail) in
                completionHandler(pokemonDetail)
        }
    }
    
}

