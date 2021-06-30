//
//  MoreInfoTableViewCell.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 29/06/21.
//

import UIKit

class MoreInfoTableViewCell: UITableViewCell {
    
    static let key = Constants.key.infoViewCell

    @IBOutlet weak var moreInfoViewCell: UIView!
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Corner.createCornerCardView(view: moreInfoViewCell)
    }
    
    func showInfo(info: String) {
        moreInfoLabel.text = info
    }
}
