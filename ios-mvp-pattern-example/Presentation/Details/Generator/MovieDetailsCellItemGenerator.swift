//
//  MovieDetailsItemGenerator.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class MovieDetailsCellItemGenerator: TableViewCellItemGenerator {
    
    func generate(from data: MovieDetails) -> [TableViewSection] {
        let general = TableViewSection("General", [GeneralMovieDetailsItem(data)])
        let overview = TableViewSection("Overview", [])
        let genres = TableViewSection("Genres", [])
        let languages = TableViewSection("Spoken Languages", [])
        let companies = TableViewSection("Production Companies", [])
        
        return [general, overview, genres, languages, companies]
    }
    
}
