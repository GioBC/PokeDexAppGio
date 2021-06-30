//
//  PokemonRandomCell.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 29/06/21.
//

import UIKit

class PokemonRandomCell: UICollectionViewCell {
    
    static let key =  Constants.key.randomCell
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showData(data: pokemonDetail){
        pokemonNameLabel.text = data.name.capitalized
        let dataUrl = URL(string:(data.sprites.other?.official_artwork?.front_default)!)
        pokemonImage.sd_setImage(with: dataUrl, placeholderImage: UIImage(named: "placeholder.png"))
    }

}
