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
    
    init(_ view: T, _ dataProvider: MoviesDataProvider, _ movieId: Int) {
        self.dataProvider = dataProvider
        self.movieId = movieId
        super.init(view)
    }
    
    func loadMovieDetails() {
        view?.displayLoadingProgress()
        dataProvider.loadMovieDetails(with: movieId, completion: movieDetailsLoaded(_:_:))
    }
    
    private func movieDetailsLoaded(_ details: MovieDetails?, _ error: Error?) {
        view?.hideLoadingProgress()
        if let details = details {
            view?.display(items: [GeneralMovieDetailsItem(details)])
        }
        
    }
    
}
