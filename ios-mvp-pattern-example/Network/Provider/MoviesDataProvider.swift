//
//  MoviesDataProvider.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class MoviesDataProvider: DataProvider {
    
    /// Load movie details using id.
    ///
    /// - Parameters:
    ///   - id: Movie id.
    ///   - completion: Completion handler.
    func loadMovieDetails(with id: Int, completion: @escaping (_ response: MovieDetails?, _ error: Error?) -> ()) {
        execute(request: MoviesRouter.getDetails(id: id), completion: completion)
    }
    
}
