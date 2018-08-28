//
//  FavoriteMovieContract.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 8/28/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol FavoriteMoviesView: BaseView {
    
    /// Display list of favorite movies.
    ///
    /// - Parameter favorites: List of movies.
    func display(favorites: [FavoriteMovieItem])
    
}

protocol FavoriteMoviesPresenter {
    
    /// Load favorite movies.
    func loadFavorites()
    
}
