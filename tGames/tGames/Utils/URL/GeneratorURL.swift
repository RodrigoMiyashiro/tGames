//
//  GeneratorURL.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

struct GenerateURL
{
    static func get(type: TypeURL) -> String
    {
        var url: String
        
        switch type
        {
        case .games:
            url = APIAccess.url.rawValue + ExtensionURL.kraken.rawValue + ExtensionURL.games.rawValue + ExtensionURL.top.rawValue
        }
        
        return url
    }
}
