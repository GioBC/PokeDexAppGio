//
//  APIRepository.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import Foundation

class APIRepository {
    
    static private let limit = Constants.Pagination.limit
    
    class func getList(page: Int = 0, completionHandler: @escaping (_ data: pokemonList? ) -> Void ){

        let offset = page * limit
        let url = Constants.Url.pokemonList + "?limit=\(limit)&offset=\(offset)"
        let urlConvert = URL(string: url)
        let task = URLSession.shared.dataTask(with: urlConvert!){
            (data, response, error) in
            if let data = data {
                if let json = try? JSONDecoder().decode(pokemonList.self, from: data){
                    completionHandler(json)
                }
            }
        }
        task.resume()
    }
    
    class func getDetail(name: String?, completionHandler: @escaping (_ data: pokemonDetail? ) -> Void) {
        
        let url = Constants.Url.pokemonList + "\(name!)"
        let urlConvert = URL(string: url)
        let task = URLSession.shared.dataTask(with: urlConvert!){
            (data, response, error) in
            if let data = data {
                if let json = try? JSONDecoder().decode(pokemonDetail.self, from: data){
                    completionHandler(json)
                }
            }
        }
        task.resume()
    }
    
    class func getRandomPokemon(id: Int?, completionHandler: @escaping (_ data: pokemonDetail? ) -> Void) {
        
        let url = Constants.Url.pokemonList + "\(id!)"
        let urlConvert = URL(string: url)
        let task = URLSession.shared.dataTask(with: urlConvert!){
            (data, response, error) in
            if let data = data {
                if let json = try? JSONDecoder().decode(pokemonDetail.self, from: data){
                    completionHandler(json)
                }
            }
        }
        task.resume()
    }
}




