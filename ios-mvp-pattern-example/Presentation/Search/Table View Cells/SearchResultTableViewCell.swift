//
//  SearchResultTableViewCell.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 12/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    static let cellIdentifier = "SearchResultTableViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!

    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        descriptionLabel.text = movie.overview
    }
}
