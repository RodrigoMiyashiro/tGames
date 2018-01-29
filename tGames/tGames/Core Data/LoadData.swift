//
//  LoadData.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 28/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import CoreData

class LoadData
{
    var dataManager = DataManager()

    func loadData() -> ListGame?
    {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ListGameDB")
        let context = dataManager.persistentContainer.viewContext
        
        do
        {
            if let result = try context.fetch(fetchRequest) as? [NSManagedObject]
            {
                if let list = result.first as? ListGameDB
                {
                    return self.convertToListGame(withListDB: list)
                }
            }
        }
        catch
        {
            fatalError("-->> Error is retriving titles items")
        }
        return nil
    }
    
    
    private func convertToListGame(withListDB listDB: ListGameDB) -> ListGame
    {
        let gameViewerChannel = listGames(list: listDB.gameViewerChannel ?? NSOrderedSet())
        
        let link = Link(current: listDB.link?.current ?? "", next: listDB.link?.next ?? "")
        let list = ListGame(total: Int(listDB.total), links: link, games: gameViewerChannel)
        return list
    }
    
    private func listGames(list: NSOrderedSet) -> [GameViewerChannel]
    {
        var gamesViewerChannel = [GameViewerChannel]()
        
        for gameVCDB in list.array
        {
            let imgBox = ElementImage(large: (gameVCDB as! GameViewerChannelDB).game!.box!.large!, medium: (gameVCDB as! GameViewerChannelDB).game!.box!.medium!, small: (gameVCDB as! GameViewerChannelDB).game!.box!.small!, template: (gameVCDB as! GameViewerChannelDB).game!.box!.template!)
            let imgLogo = ElementImage(large: (gameVCDB as! GameViewerChannelDB).game!.logo!.large!, medium: (gameVCDB as! GameViewerChannelDB).game!.logo!.medium!, small: (gameVCDB as! GameViewerChannelDB).game!.logo!.small!, template: (gameVCDB as! GameViewerChannelDB).game!.logo!.template!)
            
            let game = Game(name: (gameVCDB as! GameViewerChannelDB).game!.name!, popularity: Int((gameVCDB as! GameViewerChannelDB).game!.popularity), id: Int((gameVCDB as! GameViewerChannelDB).game!.id), giantbombID: Int((gameVCDB as! GameViewerChannelDB).game!.giantbombID), box: imgBox, logo: imgLogo, localizedName: ((gameVCDB as! GameViewerChannelDB).game?.localizedName)!)
            
            let gameVC = GameViewerChannel(game: game, viewers: Int((gameVCDB as! GameViewerChannelDB).viewer), channels: Int((gameVCDB as! GameViewerChannelDB).channel))
            
            gamesViewerChannel.append(gameVC)
        }
        
        return gamesViewerChannel
    }
}
