//
//  MovieDetailsContract.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol MovieDetailsView: BaseView {
    
    func displayLoadingProgress()
    
    func hideLoadingProgress()
    
}

protocol MovieDetailsPresenter {
 
    func loadMovieDetails()
    
}
