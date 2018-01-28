//
//  ListGameViewController.swift
//  tGames
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class ListGameViewController: CustomViewController
{
    // MARK: - Lets and Vars
    var refreshControl: UIRefreshControl!
    var listGameViewModel: ListGameViewModel?
    {
        didSet
        {
            listGameViewModel?.listGameDidChange = { [weak self] viewModel in
                self?.refreshControl.endRefreshing()
                self?.listGameCollectionView.reloadData()
            }
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var listGameCollectionView: UICollectionView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configTitle(title: "tGames")
        listGameViewModel = ListGameViewModel()
        getGames()
        
        configPullToRefresh()
        infinityScroll()
    }
    
    
    @objc private func getGames()
    {
        listGameViewModel?.getGames(completion: { (error) in
            if let error = error
            {
                print("-->> Error get games [VC]: \(error)")
                self.refreshControl.endRefreshing()
            }
        })
    }
    
    private func addMoreGames(withURL url: String)
    {
        listGameViewModel?.add(withURL: url, completion: { (error) in
            if let error = error
            {
                print("-->> Error get more games [VC]: \(error)")
            }
        })
    }
    
    private func infinityScroll()
    {
        listGameCollectionView.addInfiniteScroll { (collectionView) in
            collectionView.performBatchUpdates({
                let nextURL = self.listGameViewModel?.listGames?.links.next ?? ""
                self.addMoreGames(withURL: nextURL)
                collectionView.finishInfiniteScroll()
            }, completion: { (finished) in

            })
        }
    }
    
    private func configPullToRefresh()
    {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(getGames), for: UIControlEvents.valueChanged)
        listGameCollectionView.addSubview(refreshControl)
    }
    
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == Segue.detailGame.rawValue
        {
            let showDetailGame = segue.destination as! DetailGameViewController
            let itemSelected = listGameCollectionView.indexPathsForSelectedItems?[0].item
            
            showDetailGame.gameViewerChannel = (listGameViewModel?.listGames?.games[itemSelected!])!
        }
    }
}


// MARK: - CollectionView DataSource
extension ListGameViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return listGameViewModel?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = listGameCollectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.listGame.rawValue, for: indexPath) as! ListGameCollectionViewCell
        
        let item = indexPath.item
        let game = listGameViewModel?.listGames?.games[item].game
        
        cell.game = game
        
        return cell
    }
}


// MARK: - CollectionView Delegate
extension ListGameViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        listGameCollectionView.deselectItem(at: indexPath, animated: true)        
    }
}


// MARK: - CollectionView DelegateFlowLayout
extension ListGameViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let space = self.view.frame.size.width > 400 ? 34 : 26
        let width = (self.view.frame.size.width - CGFloat(space)) / 2
        var heightCtr = width + 10
        
        if self.view.frame.size.width > 375.0 { heightCtr = heightCtr - 30 }
        else if self.view.frame.size.width > 320.0 { heightCtr = heightCtr - 20 }
        
        let height = heightCtr * 1.55
        
        return CGSize(width: width, height: height)
    }
}
