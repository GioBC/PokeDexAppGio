//
//  CollectionViewCell.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 29/06/21.
//

import UIKit
import SDWebImage
import CoreData

class FavoriteCell: UICollectionViewCell {
    
    //MARK: - Identifier
    static let key = Constants.key.favoriteCell
    
    @IBOutlet weak var urlImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Corner.createCornerCardView(view: cardView)
    }
    
    //MARK: - Public Methods
    func showData(pokemonData: NSManagedObject){
        nameLabel.text = (pokemonData as! Pokemon ).name?.capitalized
        let convertUrl = URL(string: (pokemonData as! Pokemon ).url! )
        urlImage.sd_setImage(with: convertUrl, placeholderImage: UIImage(named: "placeholder.png"))
    }
}
