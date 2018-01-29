//
//  GameViewerChannelDB+CoreDataProperties.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 29/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//
//

import Foundation
import CoreData


extension GameViewerChannelDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameViewerChannelDB> {
        return NSFetchRequest<GameViewerChannelDB>(entityName: "GameViewerChannelDB")
    }

    @NSManaged public var viewer: Int64
    @NSManaged public var channel: Int64
    @NSManaged public var game: GameDB?
    @NSManaged public var listGame: ListGameDB?

}
