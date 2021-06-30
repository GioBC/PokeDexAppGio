//
//  PokemonListViewController.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import UIKit
import Toast_Swift
import PKHUD

class PokemonListViewController: UIViewController {

    @IBOutlet weak var pokemonListTable: UITableView!
    
    //MARK: - Attributes
    var viewModel: PokemonListViewModel = PokemonListViewModel()
   
    //MARK: - Outlets
    @IBOutlet var tableList: UITableView!
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCell()
        ConfigTable()
        viewModel.didLoadList = { [weak self] in
            self?.pokemonListTable.reloadData()
        }
        viewModel.loadPokemonList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Private Methods
    private func loadCell(){
        pokemonListTable.register(UINib(nibName: PokemonListCell.key, bundle: Bundle.main), forCellReuseIdentifier: PokemonListCell.key)
    }
    
    private func ConfigTable() {
        pokemonListTable.dataSource = self
        pokemonListTable.delegate = self
        pokemonListTable.rowHeight = 120
        pokemonListTable.separatorStyle = .none
    }
    
    @IBAction func actionfavoriteButton(_ sender: Any) {
        let favoriteController = ControllerManager.FavoriteViewController()
        navigationController?.pushViewController(favoriteController, animated: false)
    }
    //MARK: -Actions -Targets
    /*@objc func actionfavoriteButton(sender: UIButton!){
        let favoriteController = Controller.FavoriteViewController()
        navigationController?.pushViewController(favoriteController, animated: false)
        
    }*/
    
     @IBAction func actionRandomButton(_ sender: Any) {
        let randomController = ControllerManager.PokemonRandomViewController()
        navigationController?.pushViewController(randomController, animated: false)
     }
}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.pokemon.count > 0 {
            return viewModel.pokemon.count
        }else{
            return  0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListCell.key, for: indexPath) as! PokemonListCell
        let pokemonData =  viewModel.pokemon[indexPath.row]
        let pokemonId = indexPath.row + 1
        cell.ShowCell(with: pokemonData, idPokemon: pokemonId)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.pokemon.count - 10 && !viewModel.loadingPokemon && viewModel.pokemon.count != viewModel.total {
            viewModel.curretPage += 1
            viewModel.loadPokemonList()
            self.view.makeToast(Constants.textToast.load, duration: 3.0, position: .bottom)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemonDetailController = ControllerManager.PokemonDetailViewController()
        pokemonDetailController.viewModel.pokemon = viewModel.pokemon[indexPath.row]
        navigationController?.pushViewController(pokemonDetailController, animated: false)
    }
}


