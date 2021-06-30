//
//  PokemonRandomViewController.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 29/06/21.
//

import UIKit
import Toast_Swift
import PKHUD

class PokemonRandomViewController: UIViewController {
    
    //MARK: - Attributes
    var pokemon: pokemonDetail!
    let manager = CoreDataManager()
    var type: Int = 0
    var id: Int = 0
    
    //MARK: - Outlets
    @IBOutlet weak var randomCollectionView: UICollectionView!
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        randomCollectionView.delegate = self
        randomCollectionView.dataSource = self
        addGesture()
        loadRandom()
        loadCell()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Private Methods
    private func loadRandom(){
        switch type {
        case 0:
            HUD.show(.progress)
        case 1 :
            HUD.show(.success)
        case 2:
            HUD.show(.error)
        default:
            break
        }
        
        let randomInt = Int.random(in: 1..<898)
        let randomViewModel: PokemonRandomViewModel = PokemonRandomViewModel()
        randomViewModel.getRandomPokemon(id: randomInt) { pokemonDetail in
            DispatchQueue.main.async {
                self.id = randomInt
                self.pokemon = pokemonDetail
                self.randomCollectionView.reloadData()
                HUD.hide()
            }
        }
    }
    
    private func addGesture(){
        let swipeToLeft = UISwipeGestureRecognizer(target: self, action: #selector(Swipeleft(_:)))
        let swipeToRight = UISwipeGestureRecognizer(target: self, action: #selector(SwipeRight(_:)))
        swipeToLeft.direction = .right
        swipeToRight.direction = .left
        self.randomCollectionView.addGestureRecognizer(swipeToLeft)
        self.randomCollectionView.addGestureRecognizer(swipeToRight)
    }
    
    @objc  func Swipeleft(_ gesture: UISwipeGestureRecognizer) {
        self.type = 2
        loadRandom()
    }
    
    
    @objc  func SwipeRight(_ gesture: UISwipeGestureRecognizer) {
        self.type = 1
        manager.savePokemon(name: pokemon.name, url: (pokemon.sprites.other?.official_artwork?.front_default)!, id: id)
        loadRandom()
    }
    
    private func loadCell(){
        randomCollectionView.register(UINib(nibName: PokemonRandomCell.key, bundle: Bundle.main), forCellWithReuseIdentifier: PokemonRandomCell.key)
    }
}

extension PokemonRandomViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: - CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = randomCollectionView.dequeueReusableCell(withReuseIdentifier: PokemonRandomCell.key, for: indexPath) as! PokemonRandomCell
        
        if pokemon != nil {
            cell.showData(data: pokemon)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: randomCollectionView.frame.size.width, height: randomCollectionView.frame.size.height)
    }
    
}
