//
//  SaveData.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 28/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import CoreData

class SaveData
{
    var dataManager = DataManager()
    
    func listGameDB(list: ListGame)
    {
        let managerContext = dataManager.persistentContainer.viewContext
        let listGameDB = NSEntityDescription.entity(forEntityName: "ListGameDB", in: managerContext)
        let linkDB = NSEntityDescription.entity(forEntityName: "LinkDB", in: managerContext)
        let gameViewerChannelDB = NSEntityDescription.entity(forEntityName: "GameViewerChannelDB", in: managerContext)
        let gameDB = NSEntityDescription.entity(forEntityName: "GameDB", in: managerContext)
        let elementImageLogoDB = NSEntityDescription.entity(forEntityName: "ElementImageDB", in: managerContext)
        let elementImageBoxDB = NSEntityDescription.entity(forEntityName: "ElementImageDB", in: managerContext)
        
        if let listGameDB = listGameDB,
            let linkDB = linkDB,
            let gameViewerChannelDB = gameViewerChannelDB,
            let gameDB = gameDB,
            let elementImageLogoDB = elementImageLogoDB,
            let elementImageBoxDB = elementImageBoxDB
        {
            let elementGame = ListGameDB(entity: listGameDB, insertInto: managerContext)
            elementGame.total = Int64(list.total)
            
            elementGame.link = LinkDB(entity: linkDB, insertInto: managerContext)
            elementGame.link?.current = list.links.current
            elementGame.link?.next = list.links.next
            
            elementGame.gameViewerChannel = [GameViewerChannelDB(entity: gameViewerChannelDB, insertInto: managerContext)]
            
            var arrayGame = Array<GameViewerChannelDB>()
            
            for gameVCDB in list.games
            {
                let gameViewerChannelDB = GameViewerChannelDB(entity: gameViewerChannelDB, insertInto: managerContext)
                gameViewerChannelDB.channel = Int64(gameVCDB.channels)
                gameViewerChannelDB.viewer = Int64(gameVCDB.viewers)
                
                gameViewerChannelDB.game = GameDB(entity: gameDB, insertInto: managerContext)
                gameViewerChannelDB.game?.id = Int64(gameVCDB.game.id)
                gameViewerChannelDB.game?.name = gameVCDB.game.name
                gameViewerChannelDB.game?.popularity = Int64(gameVCDB.game.popularity)
                gameViewerChannelDB.game?.localizedName = gameVCDB.game.localizedName
                
                gameViewerChannelDB.game?.box = ElementImageDB(entity: elementImageBoxDB, insertInto: managerContext)
                gameViewerChannelDB.game?.box?.large = gameVCDB.game.box.large
                gameViewerChannelDB.game?.box?.medium = gameVCDB.game.box.medium
                gameViewerChannelDB.game?.box?.small = gameVCDB.game.box.small
                gameViewerChannelDB.game?.box?.template = gameVCDB.game.box.template
                
                gameViewerChannelDB.game?.logo = ElementImageDB(entity: elementImageLogoDB, insertInto: managerContext)
                gameViewerChannelDB.game?.logo?.large = gameVCDB.game.logo.large
                gameViewerChannelDB.game?.logo?.medium = gameVCDB.game.logo.medium
                gameViewerChannelDB.game?.logo?.small = gameVCDB.game.logo.small
                gameViewerChannelDB.game?.logo?.template = gameVCDB.game.logo.template
                
                arrayGame.append(gameViewerChannelDB)
            }
            
            elementGame.gameViewerChannel = NSOrderedSet(array: arrayGame)
            
            do
            {
                try managerContext.save()
            }
            catch let error as NSError
            {
                print("-->> Could not save: \(error) | \(error.userInfo)")
            }
        }
    }
}
