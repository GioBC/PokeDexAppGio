//
//  Pokemon+CoreDataProperties.swift
//  
//
//  Created by WILLIAM.ARDILA on 14/03/21.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var id: Int?

}
