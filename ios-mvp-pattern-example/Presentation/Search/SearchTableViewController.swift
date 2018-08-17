//
//  SearchTableViewController.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 12/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    @IBOutlet private(set) weak var searchTitleLabel: UILabel!
    
    var injector = Injector()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var presenter: SearchPresenter!
    private var searchResults = [SearchResultItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SearchPresenterImpl(self, injector.providerSearchDataProvider())
        configureSearchController()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.cellIdentifier, for: indexPath)
        if let cell = cell as? ConfigurableTableViewCell {
            cell.configure(searchResults[indexPath.row])
        }
        return cell
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selection = tableView.indexPathsForSelectedRows?.first,
            let id = searchResults[selection.row].id,
            segue.identifier == "showMovieDetailsSegue" else {
            return
        }
        
        let viewController = segue.destination as? MovieDetailsTableViewController
        viewController?.movieId = id
    }
    
    // MARK: - Private
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Localization.Search.search
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
    
    func display(results: [SearchResultItem]) {
        searchResults = results
        tableView.reloadData()
    }
    
    func displaySearchInfo(message: String) {
        searchTitleLabel.text = message
    }
    
}
