//
//  FavoriteViewController.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 29/06/21.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    var pokemonObject = [NSManagedObject]()
    let manager = CoreDataManager()
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteCollectionView.delegate = self
        favoriteCollectionView.dataSource = self
        getSavingFavorites()
        loadCell()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if pokemonObject.count > 0{
            return pokemonObject.count
        }else{
            return 0
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCell.key, for: indexPath) as! FavoriteCell
        let data = pokemonObject[indexPath.row]
        cell.showData(pokemonData: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = pokemonObject[indexPath.row]
        let name =  (data as! Pokemon ).name
        guard let url = URL(string: Constants.Url.pokemonWiki + name!) else { return }
        UIApplication.shared.open(url)
    }
    
    //MARK: - Private Methods
    private func loadCell(){
        favoriteCollectionView.register(UINib(nibName: FavoriteCell.key, bundle: Bundle.main), forCellWithReuseIdentifier: FavoriteCell.key)
    }
    
    private func getSavingFavorites(){
        if self.manager.fetchPokemon().count > 0 {
            pokemonObject = self.manager.fetchPokemon()
        }
    }
    
}
