//
//  ViewController.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonsButton: UIButton!
    @IBOutlet weak var generationsButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func goToPokemos(_ sender: Any) {
        let listController = ControllerManager.PokemonListViewController()
        self.navigationController?.pushViewController(listController, animated: false)
    }
    
    @IBAction func goToGeneration(_ sender: Any) {
    }
    
    
}

