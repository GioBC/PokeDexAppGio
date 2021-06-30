//
//  Constants.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import Foundation

struct Constants {
    
    struct Pagination {
        static let limit = 30
    }

    struct Url {
        static let pokemonList = "https://pokeapi.co/api/v2/pokemon/"
        static let pokemonGenerations = "https://pokeapi.co/api/v2/generation/"
        static let pokemonWiki = "https://pokemon.fandom.com/es/wiki/"
    }
    
    struct key {
        static let listCell = "PokemonListCell"
        static let generationsCell = "PokemonGenerationsCell"
        static let infoViewCell = "MoreInfoTableViewCell"
        static let spritesCell = "PokemonSpritesCell"
        static let randomCell = "PokemonRandomCell"
        static let favoriteCell = "FavoriteCell"
    }
    
    struct textToast {
        static let load = "Loading 20 more"
        static let number = "Number of Pokemon for generation: "
    }
    
    struct storyBoardName {
        static let pokemonlist = "PokemonList"
        static let detail = "PokemonDetail"
        static let moreInfo = "MoreInfo"
        static let generations = "PokemonGenerations"
        static let random = "PokemonRandom"
        static let favorite = "Favorite"
    }
    
    struct viewControllerName {
        static let pokemonListViewController = "PokemonListViewController"
        static let pokemonDetailViewController = "PokemonDetailViewController"
        static let moreInfoViewController =  "MoreInfoViewController"
        static let generationsViewController =  "PokemonGenerationsViewController"
        static let randomViewController =  "PokemonRandomViewController"
        static let favoriteViewController =   "FavoriteViewController"
    }
    
}


