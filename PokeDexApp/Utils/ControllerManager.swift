//
//  ControllerManager.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import Foundation
import UIKit

class ControllerManager {

    static func PokemonListViewController() -> PokemonListViewController {
        let storyBoardList: UIStoryboard = UIStoryboard(name:Constants.storyBoardName.pokemonlist, bundle: nil)
        let pokemonListController = storyBoardList.instantiateViewController(withIdentifier: Constants.viewControllerName.pokemonListViewController) as! PokemonListViewController
        return pokemonListController
    }
    
    static func PokemonDetailViewController() -> PokemonDetailViewController {
        let storyBoardDetail: UIStoryboard = UIStoryboard(name:Constants.storyBoardName.detail, bundle: nil)
        let listController = storyBoardDetail.instantiateViewController(withIdentifier: Constants.viewControllerName.pokemonDetailViewController) as! PokemonDetailViewController
        return listController
    }
    
    static func MoreInfoViewController() -> MoreInfoViewController {
        let storyBoardInfo: UIStoryboard = UIStoryboard(name:Constants.storyBoardName.moreInfo, bundle: nil)
        let infoController = storyBoardInfo.instantiateViewController(withIdentifier: Constants.viewControllerName.moreInfoViewController) as! MoreInfoViewController
        return infoController
    }
    
    static func PokemonRandomViewController() -> PokemonRandomViewController {
        let storyBoardRandom: UIStoryboard = UIStoryboard(name:Constants.storyBoardName.random, bundle: nil)
        let randomController = storyBoardRandom.instantiateViewController(withIdentifier: Constants.viewControllerName.randomViewController) as! PokemonRandomViewController
        return randomController
    }
    
    static func FavoriteViewController() -> FavoriteViewController {
        let storyBoardFavorite: UIStoryboard = UIStoryboard(name:Constants.storyBoardName.favorite, bundle: nil)
        let favoriteController = storyBoardFavorite.instantiateViewController(withIdentifier: Constants.viewControllerName.favoriteViewController) as! FavoriteViewController
        return favoriteController
    }
}
