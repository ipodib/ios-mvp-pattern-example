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
    
    @IBOutlet private var addToFavoritesButton: UIBarButtonItem!
    @IBOutlet private var removeFromFavoritesButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        injector = Injector()
        presenter = MovieDetailsPresenterImpl(self, MoviesDataProvider(), movieId,
                                              injector.provideFavoritesRepository())
        presenter?.loadMovieDetails()
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.addToFavorites()
    }
    
    @IBAction func removeButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.removeFromFavorites()
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
    
    func display(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func displayFavoritesAs(hidden: Bool) {
        navigationItem.rightBarButtonItems = hidden ? [removeFromFavoritesButton] : [addToFavoritesButton]
    }
}
