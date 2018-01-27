//
//  ErrorManager.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

struct ErrorManager
{
    static func error(type: ErrorType) -> NSError
    {
        switch type
        {
        case .unknown:
            return NSError(domain: "Não foi possível acessar no momento.", code: 404, userInfo: nil)
        case .alamofire:
            return NSError(domain: "Erro na requisição...", code: 430, userInfo: nil)
        }
    }
}
