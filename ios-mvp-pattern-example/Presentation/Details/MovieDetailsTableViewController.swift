//
//  MovieDetailsTableViewController.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class MovieDetailsTableViewController: UITableViewController {

    var movieId: Int!
    
    private var presenter: MovieDetailsPresenter?
    private var activituIndicator: UIActivityIndicatorView?
    private var items = [MovieDetailsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter = MovieDetailsPresenterImpl(self, MoviesDataProvider(), movieId)
        presenter?.loadMovieDetails()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        if let cell = cell as? ConfigurableTableViewCell {
            cell.configure(item)
        }
        return cell
    }
    
    private func configureView() {
        activituIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activituIndicator?.startAnimating()
        activituIndicator?.isHidden = true
        tableView.backgroundView = activituIndicator
    }

}

extension MovieDetailsTableViewController: MovieDetailsView {
    
    func displayLoadingProgress() {
        activituIndicator?.isHidden = false
    }
    
    func hideLoadingProgress() {
        activituIndicator?.isHidden = true
    }
    
    func display(items: [MovieDetailsItem]) {
        self.items = items
        tableView.reloadData()
    }
}
