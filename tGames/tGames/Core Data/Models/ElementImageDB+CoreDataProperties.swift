//
//  ElementImageDB+CoreDataProperties.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 29/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//
//

import Foundation
import CoreData


extension ElementImageDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElementImageDB> {
        return NSFetchRequest<ElementImageDB>(entityName: "ElementImageDB")
    }

    @NSManaged public var large: String?
    @NSManaged public var medium: String?
    @NSManaged public var small: String?
    @NSManaged public var template: String?
    @NSManaged public var imageBox: GameDB?
    @NSManaged public var imageLogo: GameDB?

}
