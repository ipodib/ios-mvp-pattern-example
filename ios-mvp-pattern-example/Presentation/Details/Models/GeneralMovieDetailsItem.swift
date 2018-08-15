//
//  GeneralMovieDetailsItem.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class GeneralMovieDetailsItem: MovieDetailsItem {

    var posterPath: String?
    var title: String?
    var duration: String?
    var releaseDate: String?
    var language: String?
    var rating: String?
    
    var cellIdentifier: String {
        return "GeneralMovieDetailsTableViewCell"
    }
    
    required init(_ details: MovieDetails) {
        posterPath = details.posterPath
        title = details.originalTitle
        releaseDate = details.releaseDate
        language = details.originalLanguage
        
        if let runtime = details.runtime {
            duration = "\(runtime) min"
        }
        
        if let voteAverage = details.voteAverage {
            rating = "\(voteAverage)/10"
        }
    }
    
}
