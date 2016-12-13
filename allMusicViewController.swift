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
        navigationItem.title = "Finesse"
        navigationController?.title = "Finesse"
        navigationItem.titleView?.tintColor = UIColor.white
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        self.collectionView!.showsVerticalScrollIndicator = false
        self.collectionView!.backgroundColor = UIColor.black
        self.collectionView!.register(musicSelectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return playlistArtArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! musicSelectionViewCell
        cell.musicImageView.image = UIImage(named: playlistArtArray[indexPath.row])
        cell.musicButtonCounterpart.isEnabled = true
        
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
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.dismiss(animated: true, completion: nil)
        }


    
//     Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func goToPlaylist() {
        self.dismiss(animated: true, completion: nil)
    }

}
