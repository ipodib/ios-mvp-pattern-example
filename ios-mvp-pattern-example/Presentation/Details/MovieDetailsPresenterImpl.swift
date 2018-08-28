//
//  MovieDetailsPresenterImpl.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class MovieDetailsPresenterImpl<T: MovieDetailsView>: BasePresenterImpl<T>, MovieDetailsPresenter {
    
    private let dataProvider: MoviesDataProvider
    private let movieId: Int
    private let detailsGenerator: MovieDetailsCellItemConvertor
    private let repository: FavoritesRepository
    private var movieDetails: MovieDetails?
    
    init(_ view: T, _ dataProvider: MoviesDataProvider, _ movieId: Int, _ repository: FavoritesRepository) {
        self.dataProvider = dataProvider
        self.movieId = movieId
        self.detailsGenerator = MovieDetailsCellItemConvertor()
        self.repository = repository
        super.init(view)
        updateFavoritesState()
    }
    
    func loadMovieDetails() {
        view?.displayLoadingProgress()
        dataProvider.loadMovieDetails(with: movieId, completion: movieDetailsLoaded(_:_:))
    }
    
    func addToFavorites() {
        guard let movie = movieDetails else {
            return
        }
        
        repository.add(movie)
        
        view?.display(message: Localization.MovieDetails.addedToFavoritesMessage)
        view?.displayFavoritesAs(hidden: true)
    }
    
    func removeFromFavorites() {
        repository.remove(by: movieId)
        view?.displayFavoritesAs(hidden: false)
    }
    
    private func movieDetailsLoaded(_ details: MovieDetails?, _ error: Error?) {
        view?.hideLoadingProgress()
        if let details = details {
            movieDetails = details
            view?.display(sections: detailsGenerator.convert(from: details))
        }
    }
    
    private func updateFavoritesState() {
        if let _ = repository.fetch(by: movieId) {
            view?.displayFavoritesAs(hidden: true)
        } else {
            view?.displayFavoritesAs(hidden: false)
        }
    }
    
}
