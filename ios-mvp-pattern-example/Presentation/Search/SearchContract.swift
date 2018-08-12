//
//  SearchContract.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 12/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol SearchView: BaseView {

    /// Display list of movies.
    ///
    /// - Parameter movies: List of movies.
    func display(movies: [Movie])
    
    /// Display search results info.
    ///
    /// - Parameter message: Message text.
    func displaySearchInfo(message: String)

}

protocol SearchPresenter {
    
    /// Search for movies using given query.
    ///
    /// - Parameter query: Query string.
    func search(query: String?)
    
}
