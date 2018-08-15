//
//  SearchTableViewController.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 12/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    @IBOutlet private weak var searchTitleLabel: UILabel!
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var presenter: SearchPresenter?
    private var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SearchPresenterImpl(self, SearchDataProvider())
        configureSearchController()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.cellIdentifier, for: indexPath) as! SearchResultTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selection = tableView.indexPathForSelectedRow else {
            return
        }
        
        if let id = movies[selection.row].id, segue.identifier == "showMovieDetailsSegue" {
            let viewController = segue.destination as? MovieDetailsTableViewController
            viewController?.movieId = id
        }
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }

}

extension SearchTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        presenter?.search(query: searchController.searchBar.text)
    }
    
}

extension SearchTableViewController: SearchView {
    
    func display(movies: [Movie]) {
        self.movies = movies
        tableView.reloadData()
    }
    
    func displaySearchInfo(message: String) {
        searchTitleLabel.text = message
    }
    
}
