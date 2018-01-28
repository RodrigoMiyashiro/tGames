//
//  DetailGameViewController.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class DetailGameViewController: CustomViewController
{
    // MARK: - Lets and Vars
    var gameViewerChannel = GameViewerChannel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var gameTopImage: UIImageView!
    @IBOutlet weak var nameGameLabel: UILabel!
    @IBOutlet weak var channelsCountLabel: UILabel!
    @IBOutlet weak var viewersCountLabel: UILabel!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        print("-->> Game: \(gameViewerChannel.game.name)")
        setDetailGame()
    }

    
    private func setDetailGame()
    {
        self.configTitle(title: gameViewerChannel.game.name)
        
        backgroundImage.download(image: gameViewerChannel.game.box.large)
        gameTopImage.download(image: gameViewerChannel.game.logo.large)
        nameGameLabel.text = gameViewerChannel.game.name
        channelsCountLabel.text = String(gameViewerChannel.channels)
        viewersCountLabel.text = String(gameViewerChannel.viewers)
    }
}
