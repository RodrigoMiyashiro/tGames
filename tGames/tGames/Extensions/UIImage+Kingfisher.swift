//
//  UIImage+Kingfisher.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView
{
    func download(image url: String)
    {
        guard let imgURL = URL(string: url) else {
            return
        }
        
        self.kf.indicator?.startAnimatingView()
        self.kf.setImage(with: ImageResource(downloadURL: imgURL))
        self.kf.indicator?.stopAnimatingView()
    }
}
