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
    func add(withURL url: String, completion: @escaping(Error?) -> Void)
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
    
    func numberOfRows() -> Int
    {
        return listGames?.games.count ?? 0
    }
}

extension ListGameViewModel
{
    func getGames(completion: @escaping (Error?) -> Void)
    {
        let urlInitialRequest = GenerateURL.get(type: .games)
        GamesManager.getGames(withURL: urlInitialRequest) { (games, error) in
            if let list = games
            {
                DeleteData().ListGameDB()
                SaveData().listGameDB(list: list)
                self.listGames = list
            }
            if let error = error
            {
                self.listGames = LoadData().loadData()
                completion(error)
            }
        }
    }
    
    
    func add(withURL url: String, completion: @escaping (Error?) -> Void)
    {
        GamesManager.getGames(withURL: url) { (games, error) in
            if let list = games
            {
                let tempList = self.listGames
                tempList?.links = list.links
                tempList?.games += list.games
                
                SaveData().listGameDB(list: tempList!)
                self.listGames = tempList
            }
            if let error = error
            {
                completion(error)
            }
        }
    }
}
