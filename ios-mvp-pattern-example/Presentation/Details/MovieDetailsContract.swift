//
//  MovieDetailsContract.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol MovieDetailsView: BaseView {
    
    /// Display loading indicator.
    func displayLoadingProgress()
    
    /// Hide progress indicator.
    func hideLoadingProgress()
    
    /// Display movie details sections.
    ///
    /// - Parameter sections: List of sections with items.
    func display(sections: [TableViewSection])
    
}

protocol MovieDetailsPresenter {
 
    /// Initate loading movie details.
    func loadMovieDetails()
    
    /// Add current movie to favorites
    func addToFavorites()
    
}
