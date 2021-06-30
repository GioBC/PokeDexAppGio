//
//  Pokemon+CoreDataClass.swift
//  
//
//  Created by WILLIAM.ARDILA on 14/03/21.
//
//

import Foundation
import CoreData

@objc(Pokemon)
public class Pokemon: NSManagedObject,Codable {
    
    required convenience public init(from decoder: Decoder) throws {
        
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Pokemon", in: managedObjectContext)
            else {
                fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            name = try values.decode(String.self, forKey: .name)
            url = try values.decode(String.self, forKey: .url)
            id = try values.decode(Int.self, forKey: .id)
        } catch {
        } catch {
            print ("error")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case id = "id"
    }

}
