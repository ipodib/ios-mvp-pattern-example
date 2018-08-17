//
//  SearchResultItem.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 17/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class SearchResultItem: TableViewCellItem {
    
    var id: Int?
    var posterPath: String?
    var title: String?
    var overview: String?
    
    var cellIdentifier: String {
        return SearchResultTableViewCell.cellIdentifier
    }
    
    init(_ data: Movie) {
        id = data.id
        posterPath = data.posterPath
        title = data.title
        overview = data.overview
    }
    
}
