//
//  GameDB+CoreDataProperties.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 29/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//
//

import Foundation
import CoreData


extension GameDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameDB> {
        return NSFetchRequest<GameDB>(entityName: "GameDB")
    }

    @NSManaged public var name: String?
    @NSManaged public var popularity: Int64
    @NSManaged public var id: Int64
    @NSManaged public var giantbombID: Int64
    @NSManaged public var localizedName: String?
    @NSManaged public var box: ElementImageDB?
    @NSManaged public var logo: ElementImageDB?
    @NSManaged public var gameVC: GameViewerChannelDB?

}
