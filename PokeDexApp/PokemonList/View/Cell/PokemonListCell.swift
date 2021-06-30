//
//  PokemonListCell.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import UIKit
import SDWebImageSVGCoder

class PokemonListCell: UITableViewCell {
    
    static let key = Constants.key.listCell

    @IBOutlet weak var pokemonContentView: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Corner.createCornerCardView(view: pokemonView)
    }

    func ShowCell(with pokemon: pokemonData, idPokemon: Int) {
       let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/" + "\(idPokemon).svg" )
        pokemonImage.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        pokemonName.text = pokemon.name.capitalized
    }
    
}
