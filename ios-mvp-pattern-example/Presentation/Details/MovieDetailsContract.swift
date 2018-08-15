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
    
    func display(items: [MovieDetailsItem])
    
}

protocol MovieDetailsPresenter {
 
    /// Initate loading movie details.
    func loadMovieDetails()
    
}
