//
//  MoreInfoViewController.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 29/06/21.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    var viewModel: PokemonDetailViewModel = PokemonDetailViewModel()
    //var pokemonDetail: pokemonDetail!
    var typeInfo = 0
    
    @IBOutlet weak var moreInfoTableView: UITableView!
    @IBOutlet weak var moreInfoSegment: UISegmentedControl!
    @IBOutlet weak var moreInfoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moreInfoTableView.dataSource = self
        moreInfoTableView.delegate = self
        loadCell()
        Corner.createCornerCardView(view: moreInfoView)

        // Do any additional setup after loading the view.
    }
    
    private func loadCell(){
        moreInfoTableView.register(UINib(nibName: MoreInfoTableViewCell.key, bundle: Bundle.main), forCellReuseIdentifier: MoreInfoTableViewCell.key)
    }
    
    @IBAction func infoSegmented(_ sender: Any) {
        switch moreInfoSegment.selectedSegmentIndex
        {
        case 0:
            typeInfo = 0
            moreInfoTableView.reloadData()
        case 1:
            typeInfo = 1
            moreInfoTableView.reloadData()
        default:
            break
            
        }
    }
}

extension MoreInfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if typeInfo == 0 {
            return viewModel.pokemonDetail.moves.count
        }else{
            return viewModel.pokemonDetail.abilities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoreInfoTableViewCell.key, for: indexPath) as! MoreInfoTableViewCell
        if typeInfo == 0 {
            let moves =  viewModel.pokemonDetail.moves[indexPath.row]
            cell.showInfo(info: moves.move.name.capitalized)
        } else {
            let ability =  viewModel.pokemonDetail.abilities[indexPath.row]
            cell.showInfo(info: ability.ability.name.capitalized)
        }
        return cell
    }
        
}
