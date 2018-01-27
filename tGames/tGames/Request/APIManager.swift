//
//  APIManager.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - Token Manager
class GamesManager: NSObject
{
    static func getGames(completion: @escaping(ListGame?, Error?) -> Void)
    {
        let url = GenerateURL.get(type: .games)
        let header = [HeaderRequest.clienteID.rawValue : ClientID.value.rawValue]
        
        Request.getFrom(url, headers: header) { (result) in
            if let data = result as? Data
            {
                let token = ListGame(dataJSON: JSON(data))
                completion(token, nil)
            }
            else if let error = result as? Error
            {
                completion(nil, error)
            }
            else
            {
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
}
