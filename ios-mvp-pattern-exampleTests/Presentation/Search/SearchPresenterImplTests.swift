//
//  SearchPresenterImplTests.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import XCTest
@testable import ios_mvp_pattern_example

class SearchPresenterImplTests: XCTestCase {
    
    var presenter: SearchPresenter!
    var viewMock: SearchViewMock!
    var dataProvider: SearchDataProviderMock!
    
    override func setUp() {
        super.setUp()
        dataProvider = SearchDataProviderMock()
        viewMock = SearchViewMock()
        presenter = SearchPresenterImpl(viewMock, dataProvider)
    }
    
    func testSearchDisplaysEmptyResultsIfQueryIsNil() {
        presenter.search(query: nil)
        XCTAssertTrue(viewMock.resultsToDisplay.isEmpty)
    }
    
    func testSearchDisplayEmptyResultsIfQueryIsEmpty() {
        presenter.search(query: "")
        XCTAssertTrue(viewMock.resultsToDisplay.isEmpty)
    }
    
    func testSearchDisplaysErrorMessageAfterSearch() {
        dataProvider.error = NSError(domain: "", code: 0, userInfo: nil)
        
        presenter.search(query: "query")
        
        XCTAssertEqual(viewMock.infoMessage, Localization.Search.unableToExecuteQuery)
    }
    
    func testSearchDisplaysCountOfFoundMovies() {
        let search = JSONLoader.loadSearchResults()
        dataProvider.searchResultResponse = search
        
        presenter.search(query: "query")
        
        XCTAssertEqual(viewMock.infoMessage, String(format: Localization.Search.foundMoviesCountFormat, "\(search!.results!.count)"))
    }
    
    func testSearchDisplaysItems() {
        let search = JSONLoader.loadSearchResults()
        dataProvider.searchResultResponse = search
        
        presenter.search(query: "query")
        
        XCTAssertEqual(viewMock.resultsToDisplay.count, search?.results?.count)
    }
    
}
