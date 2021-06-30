//
//  CollectionViewCell.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import UIKit
import SDWebImage
import Gemini

class PokemonSpriteCell: GeminiCell {

    static let key =  Constants.key.spritesCell
    
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var spriteImage: UIImageView!
    
    override func awakeFromNib() {
        Corner.createCornerCardView(view: customView)
    }
    
    func showImages(url: String)  {
        let dataUrl = URL(string:url)
        spriteImage.sd_setImage(with: dataUrl, placeholderImage: UIImage(named: "placeholder.png"))
        
    }

}
