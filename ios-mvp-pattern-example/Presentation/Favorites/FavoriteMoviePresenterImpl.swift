//
//  FavoriteMoviePresenterImpl.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 8/28/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class FavoriteMoviePresenterImpl<T: FavoriteMoviesView>: BasePresenterImpl<T>, FavoriteMoviesPresenter {
    
    private let repository: FavoritesRepository
    private let convertor: FavoriteMoviesConvertor
    
    init(_ view: T, _ repository: FavoritesRepository) {
        self.repository = repository
        self.convertor = FavoriteMoviesConvertor()
        super.init(view)
    }
    
    func loadFavorites() {
        let movies = repository.fetchAll()
        view?.display(favorites: convertor.convert(from: movies))
    }
    
}
