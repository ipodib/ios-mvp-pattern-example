//
//  GeneralMovieDetailsItem.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class GeneralMovieDetailsItem: TableViewCellItem {

    var posterPath: String?
    var title: String?
    var duration: String?
    var releaseDate: String?
    var language: String?
    var rating: String?
    
    var cellIdentifier: String {
        return GeneralMovieDetailsTableViewCell.cellIdentifier
    }
    
    required init(_ data: MovieDetails) {
        posterPath = data.posterPath
        title = data.originalTitle
        releaseDate = data.releaseDate
        language = data.originalLanguage
        
        if let runtime = data.runtime {
            duration = "\(runtime) min"
        }
        
        if let voteAverage = data.voteAverage {
            rating = "\(voteAverage)/10"
        }
    }
    
}
