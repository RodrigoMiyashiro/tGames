//
//  Game.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Game: NSObject
{
    var name: String
    var popularity: Int
    var id: Int
    var giantbombID: Int
    var box: ElementImage
    var logo: ElementImage
    var localizedName: String
    
    override init()
    {
        name = ""
        popularity = 0
        id = 0
        giantbombID = 0
        box = ElementImage()
        logo = ElementImage()
        localizedName = ""
    }
    
    required init(dataJSON: JSON)
    {
        name = dataJSON["name"].stringValue
        popularity = dataJSON["popularity"].intValue
        id = dataJSON["_id"].intValue
        giantbombID = dataJSON["giantbomb_id"].intValue
        box = ElementImage(dataJSON: dataJSON["box"])
        logo = ElementImage(dataJSON: dataJSON["logo"])
        localizedName = dataJSON["localized_name"].stringValue
    }
}
