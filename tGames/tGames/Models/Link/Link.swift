//
//  Link.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Link: NSObject
{
    var current: String
    var next: String
    
    
    override init()
    {
        current = ""
        next = ""
    }
    
    init(current: String, next: String)
    {
        self.current = current
        self.next = next
    }
    
    init(dataJSON: JSON)
    {
        current = dataJSON["self"].stringValue
        next = dataJSON["next"].stringValue
    }
}
