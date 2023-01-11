//
//  SearchController.swift
//  Podify
//
//  Created by Furkan Can Baytemur on 11.01.2023.
//

import UIKit
import Alamofire

class SearchController: UITableViewController, UISearchBarDelegate {
    
    var podcasts = [
        Podcast(trackName: "Interner", artistName: "Furkan Can"),
        Podcast(trackName: "Interner", artistName: "Furkan Can")
    ]
    
    let cellID = "cellID"
    
    // UISearchController
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    //MARK: - Setup Work
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchBar.delegate = self
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        APIService.shared.fetchPodcasts(searchText) { results in
            self.podcasts = results
            self.tableView.reloadData()
        }
        
    }
    
    //MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = podcast.trackName ?? ""
        cell.detailTextLabel?.text = podcast.artistName ?? ""
        cell.imageView?.image = UIImage(named: "AppIcon")
        
        
        return cell
    }
    
    
}
