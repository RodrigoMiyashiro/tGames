//
//  Enum.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import UIKit

enum TypeURL
{
    case games
}


enum APIAccess: String
{
    case url = "https://api.twitch.tv/"
}


enum HeaderRequest: String
{
    case clienteID = "Client-ID"
}


enum ClientID: String
{
    case value = "b0dyrvt5gm3uyu6oz0ekd0m46mdrmh"
}


enum ExtensionURL: String
{
    case kraken = "kraken/"
    case games = "games/"
    case top = "top"
}


enum ErrorType
{
    case unknown
    case alamofire
}

enum CellIdentifier: String
{
    case listGame = "listGameCell"
}

enum Segue: String
{
    case detailGame = "gameDetailSegue"
}
