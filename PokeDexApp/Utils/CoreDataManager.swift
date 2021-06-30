//
//  CoreDataManager.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 29/06/21.
//

import Foundation
import CoreData

class CoreDataManager {
    public var container : NSPersistentContainer!
    
    init() {
        container = NSPersistentContainer(name: "PokeDexApp")
        setupDatabase()
    }
    
    private func setupDatabase() {
        container.loadPersistentStores { (desc, error) in
            if error != nil {
                print("Error loading data \(desc) — \(String(describing: error))")
                return
            }
            print("Database list")
            
        }
        
    }
    
    //MARK: - Save Context
    func savePokemon(name : String, url : String, id: Int) {
        let context = container.viewContext
        let pokemon = Pokemon(context: context)
        pokemon.name = name
        pokemon.url = url
        pokemon.id = Int16(id)
        
        do {
            try context.save()
            print("Pokemon \(name) Saved")
        } catch {
            
            print("Error saving pokemon — \(error)")
        }
    }
    
    
    //MARK: - Fetch
    func fetchPokemon() -> [Pokemon] {
        let fetchRequest : NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error getting pokemon \(error)")
        }
        
        return []
    }
    
}
