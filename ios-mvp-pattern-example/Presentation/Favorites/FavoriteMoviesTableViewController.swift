//
//  FavoriteMoviesTableViewController.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 8/28/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class FavoriteMoviesTableViewController: UITableViewController {

    var injector: Injector!
    
    private var presenter: FavoriteMoviesPresenter?
    private var favorites = [FavoriteMovieItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        injector = Injector()
        presenter = FavoriteMoviePresenterImpl(self, injector.provideFavoritesRepository())
        presenter?.loadFavorites()
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selection = tableView.indexPathsForSelectedRows?.first,
            segue.identifier == "showMovieDetailsSegue" else {
                return
        }
        
        let viewController = segue.destination as? MovieDetailsTableViewController
        viewController?.movieId = favorites[selection.row].id
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = favorites[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        
        if let cell = cell as? ConfigurableTableViewCell {
            cell.configure(item)
        }
        
        return cell
    }

}

extension FavoriteMoviesTableViewController: FavoriteMoviesView {
    
    func display(favorites: [FavoriteMovieItem]) {
        self.favorites = favorites
        tableView.reloadData()
    }
    
}
