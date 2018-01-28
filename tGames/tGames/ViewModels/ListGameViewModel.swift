//
//  ListGameViewModel.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol ListGameViewModelProtocol: ListProtocol
{
    var listGames: ListGame? { get }
    var listGameDidChange: ((ListGameViewModelProtocol) -> Void)? { get set }
    
    init()
    func add(games list: ListGame)
    func getGames(completion: @escaping(Error?) -> Void)
}

class ListGameViewModel: ListGameViewModelProtocol
{
    var listGames: ListGame?
    {
        didSet
        {
            self.listGameDidChange?(self)
        }
    }
    
    
    var listGameDidChange: ((ListGameViewModelProtocol) -> Void)?
    
    
    required init()
    {
        listGames = ListGame()
    }
    
    
    func add(games list: ListGame)
    {
        listGames?.games += list.games
        listGames?.links = list.links
    }
    
    
    func numberOfRows() -> Int
    {
        return listGames?.games.count ?? 0
    }
}

extension ListGameViewModel
{
    func getGames(completion: @escaping (Error?) -> Void)
    {
        GamesManager.getGames { (games, error) in
            if let list = games
            {
                self.listGames = list
            }
            if let error = error
            {
                completion(error)
            }
        }
    }
}
