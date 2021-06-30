//
//  PokemonDetailViewController.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import UIKit
import Gemini
import PKHUD

class PokemonDetailViewController: UIViewController {
    
    var viewModel: PokemonDetailViewModel = PokemonDetailViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeNumberLabel: UILabel!
    @IBOutlet weak var pokeHpLabel: UILabel!
    
    @IBOutlet weak var pokeAttackLabel: UILabel!
    @IBOutlet weak var pokeDefenseLabel: UILabel!
    @IBOutlet weak var pokeSpAttackLabel: UILabel!
    @IBOutlet weak var pokeSpDefenseLabel: UILabel!
    @IBOutlet weak var pokeSpeedLabel: UILabel!
    @IBOutlet weak var pokeDefaultImage: UIImageView!
    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var spritesCollection: GeminiCollectionView!
    
    
    @IBOutlet weak var pokeTypeLabel: UILabel!
    @IBOutlet weak var pokeWeight: UILabel!
    @IBOutlet weak var pokeHeight: UILabel!
    
   
    
    @IBOutlet var hpView: UIView!
    @IBOutlet weak var attackView: UIView!
    @IBOutlet weak var defenseView: UIView!
    @IBOutlet weak var spAttackView: UIView!
    @IBOutlet weak var spDefenseView: UIView!
    @IBOutlet weak var speedView: UIView!
    
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStyleNavigationBar()
        loadExternalViewNavigationView()
        loadTarget()
        loadCorner()
        loadCell()
        configureAnimation()
        spritesCollection.reloadData()
        viewModel.didLoadDetail = { [weak self] in
            guard let self = self else { return }
            self.showDetailData()
        }
        viewModel.loadPokemonDetail()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadExternalViewNavigationView()
        loadStyleNavigationBar()
    }
    
    
    private func showDetailData(){
        guard let pokeDetail = viewModel.pokemonDetail else { return }
        let artOfficial = URL(string:(pokeDetail.sprites.other?.official_artwork?.front_default)!)
        pokeDefaultImage.sd_setImage(with:artOfficial , placeholderImage: UIImage(named: "placeholder.png"))
        pokeNumberLabel.text = "No.\(String(pokeDetail.id))"
        pokeNameLabel.text = pokeDetail.name.capitalized
        
        pokeWeight.text = String(viewModel.pokemonDetail.weight)
        pokeHeight.text =  String(viewModel.pokemonDetail.height)
        
        /*for type in  viewModel.pokemonDetail.types{
            pokeTypeLabel.text?.append(type.type.name.capitalized)
        }*/
        
        pokeTypeLabel.text = String(viewModel.pokemonDetail.types.first!.type.name)
        pokeHpLabel.text = String(viewModel.pokemonDetail.stats[0].base_stat)
        pokeAttackLabel.text = String(viewModel.pokemonDetail.stats[1].base_stat)
        pokeDefenseLabel.text = String(viewModel.pokemonDetail.stats[2].base_stat)
        pokeSpAttackLabel.text = String(viewModel.pokemonDetail.stats[3].base_stat)
        pokeSpDefenseLabel.text = String(viewModel.pokemonDetail.stats[4].base_stat)
        pokeSpeedLabel.text = String(viewModel.pokemonDetail.stats[5].base_stat)
        
        validateSprits()
    }
    
    func validateSprits(){
        switch viewModel.pokemonDetail.id {
        case 1...151:
            //Mark: -Generation 1
            viewModel.sprites.append(viewModel.pokemonDetail.sprites.version?.generation_i?.red_blue?.front_default ?? "")
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_ii?.gold?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_vi?.x_y?.front_default)!)
        case 152...251:
            //Mark: -Generation 2
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_ii?.gold?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_iii?.emerald?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_vi?.x_y?.front_default)!)
        case 252...386:
            //Mark: -Generation 3
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_iii?.emerald?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_iv?.diamond_pearl?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_vi?.x_y?.front_default)!)
        case 387...493:
            //Mark: -Generation 4
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_iv?.diamond_pearl?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_v?.black_white?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_vi?.x_y?.front_default)!)
        case 494...649:
            //Mark: -Generation 5
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_v?.black_white?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_vi?.x_y?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_vii?.icons?.front_default)!)
        case 650...721:
            //Mark: -Generation 6
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_vii?.icons?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_vi?.x_y?.front_default)!)
        case 722...807:
            //Mark: -Generation 7
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_vii?.icons?.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_viii?.icons?.front_default)!)
        case 808...897:
            //Mark: -Generation 8
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.front_shiny)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.version?.generation_viii?.icons?.front_default)!)
        case 898:
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.front_default)!)
            viewModel.sprites.append((viewModel.pokemonDetail.sprites.front_shiny)!)
        default:
            break
        }
    }
    
    
    private func loadCorner(){
        Corner.createCornerView(view: hpView)
        Corner.createCornerView(view: attackView)
        Corner.createCornerView(view: speedView)
        Corner.createCornerView(view: defenseView)
        Corner.createCornerView(view: spDefenseView)
        Corner.createCornerView(view: spAttackView)
    }
    
    
    private  func loadExternalViewNavigationView(){
       /* if let navigationController = self.navigationController{
            NavigationBar.createNavigationBar(navigationBar: navigationController.navigationBar,  controller: self)
        }*/
    }
    
    private func loadStyleNavigationBar(){
       /* self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = Constants.gesturesNavigationSettings.interactivePopGestureRecognizerDefault
        if let navigationItem = self.navigationController?.navigationBar.subviews[ (self.navigationController?.navigationBar.subviews.count)! - 1] as? NavigationBarView{
            navigationItem.favoriteButton.isHidden = false
            navigationItem.randomButton.isHidden = false
            navigationItem.titleLabel.text = Constants.navigationTitle.pokemonDetail
            navigationItem.favoriteButton.removeTarget(nil, action: nil, for: .allEvents)
            navigationItem.favoriteButton.addTarget(self, action: #selector(actionfavoriteButton), for: UIControl.Event.touchUpInside)
            navigationItem.randomButton.removeTarget(nil, action: nil, for: .allEvents)
            navigationItem.randomButton.addTarget(self, action: #selector(actionRandomButton), for: UIControl.Event.touchUpInside)
            navigationItem.actionNavigationButton.removeTarget(nil, action: nil, for: .allEvents)
            navigationItem.actionNavigationButton.addTarget(self, action: #selector(actionReturn), for: UIControl.Event.touchUpInside)
        }*/
    }
    
    
    private  func showInfoView(){
        let moreInfoController = ControllerManager.MoreInfoViewController()
        moreInfoController.viewModel.pokemonDetail = viewModel.pokemonDetail
        self.navigationController?.present(moreInfoController, animated: false, completion: nil)
    }
    
    private func loadCell(){
        spritesCollection.register(UINib(nibName: PokemonSpriteCell.key, bundle: Bundle.main), forCellWithReuseIdentifier: PokemonSpriteCell.key)
    }
    
    private func configureAnimation() {
        spritesCollection.gemini
            .scaleAnimation()
            .scale(0.75)
            .scaleEffect(.scaleUp)
    }
    
    
    private func loadTarget(){
        moreInfoButton.removeTarget(nil, action: nil, for: .allEvents)
        moreInfoButton.addTarget(self, action: #selector(moreInfoButtonAction), for: UIControl.Event.touchUpInside)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        spritesCollection.animateVisibleCells()
    }
    
    
    //MARK: -Actions -Targets
    @objc func moreInfoButtonAction(sender: UIButton!){
        showInfoView()
    }
    
    /*@objc func actionfavoriteButton(sender: UIButton!){
        let favoriteController = Controller.FavoriteViewController()
        navigationController?.pushViewController(favoriteController, animated: false)
    }
    
    @objc func actionRandomButton(sender: UIButton!){
        let randomController = Controller.RandomViewController()
        navigationController?.pushViewController(randomController, animated: false)
    }
    
    @objc func actionReturn(sender: UIButton!){
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.popViewController(animated: true)
    }*/
    
}

extension PokemonDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    //MARK: - CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.sprites.count > 0 {
            return viewModel.sprites.count
        }else{
            return 0
        }
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = spritesCollection.dequeueReusableCell(withReuseIdentifier: PokemonSpriteCell.key, for: indexPath) as! PokemonSpriteCell
        let data = viewModel.sprites[indexPath.row]
        cell.showImages(url: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? GeminiCell {
            self.spritesCollection.animateCell(cell)
        }
    }
    
    
}

