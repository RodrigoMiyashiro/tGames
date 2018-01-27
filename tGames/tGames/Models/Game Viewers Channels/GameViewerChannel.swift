//
//  GameViewerChannel.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class GameViewerChannel: NSObject
{
    var game: Game
    var viewers: Int
    var channels: Int
    
    override init()
    {
        game = Game()
        viewers = 0
        channels = 0
    }
    
    required init(dataJSON: JSON)
    {
        game = Game(dataJSON: dataJSON["game"])
        viewers = dataJSON["viewers"].intValue
        channels = dataJSON["channels"].intValue
    }
}
