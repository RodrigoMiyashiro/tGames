//
//  ListGameCollectionViewCell.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ListGameCollectionViewCell: UICollectionViewCell
{
    // MARK: Var
    var game: Game?
    {
        didSet
        {
            if let game = game
            {
                setLabel(name: game.name)
                setImage(imgURL: game.box.medium)
            }
        }
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var nameGameLabel: UILabel!
    
    
    private func setLabel(name: String)
    {
        nameGameLabel.text = name
    }
    
    private func setImage(imgURL: String)
    {
        gameImage.download(image: imgURL)
    }
}
