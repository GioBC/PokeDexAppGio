//
//  PokemonListViewModel.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import Foundation
import Toast_Swift
import PKHUD

class PokemonListViewModel {
    
    var pokemon: [pokemonData] = []
    var name: String?
    var id = 0
    var loadingPokemon = false
    var curretPage = 0
    var total = 0
    var didLoadList: (() -> Void)?
    
    func getPokemons(page: Int = 0 ,completionHandler: @escaping (pokemonList?) -> Void) {
        APIRepository.getList(page: page) { pokemonList in
            completionHandler(pokemonList)
        }
    }
    
    func loadPokemonList() {
        HUD.show(.progress)
        self.getPokemons(page: curretPage) { pokemonList in
            if let pokemonList = pokemonList {
                self.pokemon += pokemonList.results
                self.total = pokemonList.count
                DispatchQueue.main.async {
                    self.didLoadList?()
                    self.loadingPokemon = false
                    HUD.hide()
                }
            }
        }
    }
    
}


