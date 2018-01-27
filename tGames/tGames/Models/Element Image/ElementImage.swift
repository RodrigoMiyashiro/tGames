//
//  ElementImage.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ElementImage: NSObject
{
    var large: String
    var medium: String
    var small: String
    var template: String
    
    override init()
    {
        large = ""
        medium = ""
        small = ""
        template = ""
    }
    
    required init(dataJSON: JSON)
    {
        large = dataJSON["large"].stringValue
        medium = dataJSON["medium"].stringValue
        small = dataJSON["small"].stringValue
        template = dataJSON["template"].stringValue
    }
}
