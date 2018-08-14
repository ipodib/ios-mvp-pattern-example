//
//  SearchResultTableViewCell.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 12/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit
import Kingfisher

class SearchResultTableViewCell: UITableViewCell {

    static let cellIdentifier = "SearchResultTableViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!

    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        descriptionLabel.text = movie.overview
        loadImage(for: movie)
        
    }
    
    override func prepareForReuse() {
        posterImageView.image = nil
    }
    
    private func loadImage(for movie: Movie) {
        let dataStore = LocalDataStore()
        if let url = dataStore.apiConfig?.images?.secureBaseUrl, let path = movie.posterPath {
            posterImageView.kf.setImage(with: url.appendingPosterPath(path, quality: .medium))
        }
    }
}
