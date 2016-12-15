//
//  allMusicViewController.swift
//  Finesse Fulfilled
//
//  Created by Chandan Brown on 12/5/16.
//  Copyright © 2016 Chandan B. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AllMusicViewController: UICollectionViewController {
    
    var playlistArtArray = ["Pre-album", "It Gets Deeper", "Fulfilled-1"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        self.collectionView!.showsVerticalScrollIndicator = false
        self.collectionView!.backgroundColor = UIColor.black
        self.collectionView!.register(musicSelectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)


        // Do any additional setup after loading the view.
    }
    
    func choosePlaylist() {
        print("pressed")
        let songController = SongListTableViewController()
        let navController = UINavigationController(rootViewController: songController)
        present(navController, animated: true, completion: nil)

    }

    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return playlistArtArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.choosePlaylist))
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! musicSelectionViewCell
        cell.musicImageView.image = UIImage(named: playlistArtArray[indexPath.row])
        cell.musicButtonCounterpart.addGestureRecognizer(tap)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    
        return true
    }
 

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
 
    
//     Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! musicSelectionViewCell
        
    }
    
}
