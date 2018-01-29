//
//  LinkDB+CoreDataProperties.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 29/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//
//

import Foundation
import CoreData


extension LinkDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LinkDB> {
        return NSFetchRequest<LinkDB>(entityName: "LinkDB")
    }

    @NSManaged public var next: String?
    @NSManaged public var current: String?
    @NSManaged public var listGame: ListGameDB?

}
