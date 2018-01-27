//
//  ViewController.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        games()
    }

    func games()
    {
        GamesManager.getGames { (games, error) in
            if let list = games
            {
                print("-->> Games count: \(list.games.count)")
            }
            if let error = error
            {
                print("-->> Error get games: \(error)")
            }
        }
    }
}

