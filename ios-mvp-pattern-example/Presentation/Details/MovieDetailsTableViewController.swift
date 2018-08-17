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
    var injector: Injector!
    
    private var presenter: MovieDetailsPresenter?
    private var activituIndicator: UIActivityIndicatorView?
    private var sections = [TableViewSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        injector = Injector()
        presenter = MovieDetailsPresenterImpl(self, MoviesDataProvider(), movieId)
        presenter?.loadMovieDetails()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        if let cell = cell as? ConfigurableTableViewCell {
            cell.configure(item)
        }
        return cell
    }
    
    // MAKR: - Private
    
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
    
    func display(sections: [TableViewSection]) {
        self.sections = sections
        tableView.reloadData()
    }
}
