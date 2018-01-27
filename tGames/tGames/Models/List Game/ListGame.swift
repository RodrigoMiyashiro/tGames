//
//  ListGame.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListGame: NSObject
{
    var total: Int
    var links: Link
    var games: [GameViewerChannel]
    
    override init()
    {
        total = 0
        links = Link()
        games = [GameViewerChannel]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        total = dataJSON["_total"].intValue
        links = Link(dataJSON: dataJSON["_links"])
        parseJSON(arrayJson: dataJSON["top"].arrayValue)
    }
}


extension ListGame: ListControl
{
    func parseJSON(arrayJson: [JSON])
    {
        for json in arrayJson
        {
            let gameViewerChannel = GameViewerChannel(dataJSON: json)
            self.games.append(gameViewerChannel)
        }
    }
}
