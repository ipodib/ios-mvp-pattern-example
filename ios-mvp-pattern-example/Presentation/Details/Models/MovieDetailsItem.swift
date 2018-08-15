//
//  BaseMovieDetailsItem.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol MovieDetailsItem {
    
    var cellIdentifier: String { get }
    
    init(_ details: MovieDetails)
    
}
