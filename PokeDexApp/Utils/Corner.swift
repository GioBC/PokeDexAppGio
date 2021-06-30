//
//  Corner.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import Foundation
import UIKit

class Corner {
    
    class func createCornerView(view: UIView) {
        view.layer.cornerRadius = view.frame.size.height/3
        view.layer.borderWidth = 1
    }
    
    
    class func createCornerCardView(view: UIView){
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 2
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

