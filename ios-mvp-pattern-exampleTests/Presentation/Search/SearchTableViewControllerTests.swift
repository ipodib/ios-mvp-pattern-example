//
//  SearchTableViewControllerTests.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import XCTest
@testable import ios_mvp_pattern_example

class SearchTableViewControllerTests: XCTestCase {
    
    var viewController: SearchTableViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navController = storyboard.instantiateInitialViewController() as! UINavigationController
        viewController = navController.topViewController as! SearchTableViewController
        viewController.injector = InjectorMock()
    }
    
    func testViewDidLoadConfiguresControllerCorrectly() {
        _ = viewController.view
        
        XCTAssertTrue(viewController.definesPresentationContext)
        XCTAssertNotNil(viewController.navigationItem.searchController)
        XCTAssertFalse(viewController.navigationItem.hidesSearchBarWhenScrolling)
        XCTAssertTrue(viewController.navigationItem.searchController!.searchResultsUpdater is SearchTableViewController)
        XCTAssertFalse(viewController.navigationItem.searchController!.obscuresBackgroundDuringPresentation)
        XCTAssertEqual(viewController.navigationItem.searchController!.searchBar.placeholder, Localization.Search.search)
    }
    
    func testDisplayResultUpdatesCellCount() {
        _ = viewController.view
        
        viewController.display(results: [SearchResultItem(JSONLoader.loadMovie()!)])
        
        XCTAssertEqual(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0), 1)
    }
    
    func testDisplayResultsDisplaysCell() {
        _ = viewController.view
        
        let movie = JSONLoader.loadMovie()!
        viewController.display(results: [SearchResultItem(movie)])
        
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? SearchResultTableViewCell
        XCTAssertEqual(cell?.titleLabel.text, movie.title)
        XCTAssertEqual(cell?.descriptionLabel.text, movie.overview)
    }
    
    func testPrepareForSegueConfiguresDestinationViewController() {
        let movie = JSONLoader.loadMovie()!
        let detailsViewController = MovieDetailsTableViewController()
        let segue = UIStoryboardSegue(identifier: "showMovieDetailsSegue",
                                      source: viewController,
                                      destination: detailsViewController)
        
        _ = viewController.view
        viewController.display(results: [SearchResultItem(movie)])
        viewController.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        viewController.prepare(for: segue, sender: viewController)
        
        XCTAssertEqual(detailsViewController.movieId, movie.id)
        
    }
    
    func testDisplaySearchInfoSetsString() {
        _ = viewController.view
        
        viewController.displaySearchInfo(message: "message")
        
        XCTAssertEqual(viewController.searchTitleLabel.text, "message")
    }
    
    func testUpdateSearchResultsQueriesData() {
        let movie = JSONLoader.loadMovie()!
        _ = viewController.view
        
        viewController.display(results: [SearchResultItem(movie)])
        XCTAssertEqual(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0), 1)
        
        viewController.updateSearchResults(for: viewController.navigationItem.searchController!)
        XCTAssertEqual(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0), 0)
    }
}
