//
//  PokemonDetailViewModel.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation
import PKHUD

class PokemonDetailViewModel {
    
    var pokemon: pokemonData!
    var pokemonDetail: pokemonDetail!
    var sprites: [String] = []
    var namePokemon: String = ""
    var didLoadDetail: (() -> Void)?
    
    func getPokemonDetail(name: String,completionHandler: @escaping (pokemonDetail?) -> Void)
    {
        APIRepository.getDetail(name: name) { pokemonDetail in
            completionHandler(pokemonDetail)
        }
    }
    
    func loadPokemonDetail() {
        HUD.show(.progress)
        if pokemon != nil{
            namePokemon = pokemon.name
        }
        self.getPokemonDetail(name: namePokemon)  { pokemonDetail in
            if let infoDetail = pokemonDetail {
                self.pokemonDetail = infoDetail
                DispatchQueue.main.async {
                    self.didLoadDetail?()
                    HUD.hide()
                    //self.showDetailData()
                    //self.spritesCollection.reloadData()
                }
            }
        }
    }
}
