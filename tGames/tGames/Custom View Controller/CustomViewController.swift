//
//  CustomViewController.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import Kingfisher

class CustomViewController: UIViewController
{
    // MARK: Life Cycle
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        Spinner.stopAnimating()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    
    // MARK: Cache control
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
        print("-->> Memory Warning <<--")
        clearCache()
    }
    
    
    deinit
    {
        print("-->> DEINIT <<--")
        clearCache()
    }
    
    
    func clearCache()
    {
        print("-->> Cache Antes: \(URLCache.shared.currentMemoryUsage)")
        URLCache.shared.removeAllCachedResponses()
        let cache = KingfisherManager.shared.cache
        cache.clearDiskCache()
        cache.clearMemoryCache()
        cache.cleanExpiredDiskCache()
        print("-->> Cache Depois: \(URLCache.shared.currentMemoryUsage)")
    }
}
