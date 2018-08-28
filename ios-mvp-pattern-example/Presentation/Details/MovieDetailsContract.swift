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
    
    /// Display alert with message.
    ///
    /// - Parameter message: Message text.
    func display(message: String)
    
    /// Show or hide add to favorites button.
    ///
    /// - Parameter visible: Visibility flag.
    func displayFavoritesAs(hidden: Bool)

}

protocol MovieDetailsPresenter {
 
    /// Initate loading movie details.
    func loadMovieDetails()
    
    /// Add current movie to favorites
    func addToFavorites()
    
    /// Remove from favorites
    func removeFromFavorites()
    
}
