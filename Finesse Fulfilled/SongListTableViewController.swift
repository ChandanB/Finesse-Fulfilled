//
//  SongListTableViewController.swift
//  Finesse Fulfilled
//
//  Created by Chandan Brown on 12/14/16.
//  Copyright © 2016 Chandan B. All rights reserved.
//

import UIKit

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

class SongListTableViewController: UITableViewController, UISearchControllerDelegate {
    
    var songs =
        [
        Song(name: "Like That", trackName: "Like-That", imageArt: "Pre-album"),
        Song(name: "Finesse", trackName: "Like-That", imageArt: "FULFILLED"),
        Song(name: "Like That", trackName: "Like-That", imageArt: "It Gets Deeper"),
        Song(name: "Fulfilled", trackName: "Like-That", imageArt: "It Gets Deeper-1"),
        Song(name: "Like That", trackName: "Like-That", imageArt: "Fulfilled-1"),
        Song(name: "Like That", trackName: "Like-That", imageArt: "Pre-album"),
        Song(name: "Like That", trackName: "Like-That", imageArt: "Pre-album")
        ]
    
    let cellId = "SongTableViewCell"
    let searchController = UISearchController(searchResultsController: nil)
    lazy var searchBar: UISearchBar = UISearchBar()
    var filtered = [Song]()
    var searchActive: Bool = false


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Finesse Fulfilled"
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.leftBarButtonItem?.tintColor = .white
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: cellId)
        
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.scopeButtonTitles = ["Pre-Album", "It Gets Deeper", "Finesse Fridays"]
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchController.searchBar.sizeToFit()
        searchController.searchBar.isTranslucent = false
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.tintColor = .darkGray

    }
    
    func handleBack() {
        dismiss(animated: true, completion: nil)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! SongTableViewCell
        var song: Song
        song = songs[(indexPath as NSIndexPath).row]
        cell.playlistArtImageView.image = UIImage(named: song.imageArt)
        cell.songNameLabel.text = song.name
        cell.timeLabel.text = "0:00"
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 10).isActive = true
        return cell

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filtered = songs.filter({( song : Song) -> Bool in
            let categoryMatch = (scope == "All") || (song.name == scope)
            return categoryMatch && (song.name.lowercased().contains(searchText.lowercased()))
        })
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SongListTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        
    }
}

extension SongListTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        searchBar.placeholder = "Search Through Songs"
        // let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
