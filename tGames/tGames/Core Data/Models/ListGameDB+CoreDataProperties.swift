//
//  ListGameDB+CoreDataProperties.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 29/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//
//

import Foundation
import CoreData


extension ListGameDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListGameDB> {
        return NSFetchRequest<ListGameDB>(entityName: "ListGameDB")
    }

    @NSManaged public var total: Int64
    @NSManaged public var link: LinkDB?
    @NSManaged public var gameViewerChannel: NSOrderedSet?

}

// MARK: Generated accessors for gameViewerChannel
extension ListGameDB {

    @objc(insertObject:inGameViewerChannelAtIndex:)
    @NSManaged public func insertIntoGameViewerChannel(_ value: GameViewerChannelDB, at idx: Int)

    @objc(removeObjectFromGameViewerChannelAtIndex:)
    @NSManaged public func removeFromGameViewerChannel(at idx: Int)

    @objc(insertGameViewerChannel:atIndexes:)
    @NSManaged public func insertIntoGameViewerChannel(_ values: [GameViewerChannelDB], at indexes: NSIndexSet)

    @objc(removeGameViewerChannelAtIndexes:)
    @NSManaged public func removeFromGameViewerChannel(at indexes: NSIndexSet)

    @objc(replaceObjectInGameViewerChannelAtIndex:withObject:)
    @NSManaged public func replaceGameViewerChannel(at idx: Int, with value: GameViewerChannelDB)

    @objc(replaceGameViewerChannelAtIndexes:withGameViewerChannel:)
    @NSManaged public func replaceGameViewerChannel(at indexes: NSIndexSet, with values: [GameViewerChannelDB])

    @objc(addGameViewerChannelObject:)
    @NSManaged public func addToGameViewerChannel(_ value: GameViewerChannelDB)

    @objc(removeGameViewerChannelObject:)
    @NSManaged public func removeFromGameViewerChannel(_ value: GameViewerChannelDB)

    @objc(addGameViewerChannel:)
    @NSManaged public func addToGameViewerChannel(_ values: NSOrderedSet)

    @objc(removeGameViewerChannel:)
    @NSManaged public func removeFromGameViewerChannel(_ values: NSOrderedSet)

}
