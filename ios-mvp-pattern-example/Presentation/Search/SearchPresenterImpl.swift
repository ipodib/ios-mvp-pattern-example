//
//  SearchPresenterImpl.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 12/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class SearchPresenterImpl<T: SearchView>: BasePresenterImpl<T>, SearchPresenter {
    
    private let dataProvider: SearchDataProvider
    private let resultsGenerator: SearchResultsCellItemGenerator
    
    init(_ view: T, _ dataProvider: SearchDataProvider) {
        self.dataProvider = dataProvider
        self.resultsGenerator = SearchResultsCellItemGenerator()
        super.init(view)
    }
    
    func search(query: String?) {
        guard let query = query, !query.isEmpty else {
            display(movies: [])
            return
        }
        dataProvider.search(query, completion: didReceiveSearchResults(result:error:))
    }
    
    private func didReceiveSearchResults(result: SearchResult?, error: Error?) {
        guard let results = result?.results, error == nil else {
            view?.displaySearchInfo(message: Localization.Search.unableToExecuteQuery)
            return
        }
        
        display(movies: results)
    }
    
    private func display(movies: [Movie]) {
        view?.displaySearchInfo(message: String(format: Localization.Search.foundMoviesCountFormat, "\(movies.count)"))
        view?.display(results: resultsGenerator.generate(from: movies))
    }
}
