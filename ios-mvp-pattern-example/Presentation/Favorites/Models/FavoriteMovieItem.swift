//
//  FavoriteMovieItem.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 8/28/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class FavoriteMovieItem: TableViewCellItem {
    
    let id: Int
    var title: String?
    var posterPath: String?
    
    var cellIdentifier: String {
        return FavoriteMovieTableViewCell.cellIdentifier
    }
    
    init(_ movie: MovieDetails) {
        id = movie.id
        title = movie.title
        posterPath = movie.posterPath
    }
    
}
