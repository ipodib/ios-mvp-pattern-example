//
//  MovieDetailsTableViewCell.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class GeneralMovieDetailsTableViewCell: UITableViewCell, ConfigurableTableViewCell {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    func configure(_ item: MovieDetailsItem) {
        guard let item = item as? GeneralMovieDetailsItem else {
            return
        }
        
        titleLabel.text = item.title
        durationLabel.text = item.duration
        releaseDateLabel.text = item.releaseDate
        languageLabel.text = item.language
        ratingLabel.text = item.rating
        
        loadImage(for: item)
    }
    
    private func loadImage(for movie: GeneralMovieDetailsItem) {
        let dataStore = LocalDataStore()
        if let url = dataStore.apiConfig?.images?.secureBaseUrl, let path = movie.posterPath {
            posterImageView.kf.setImage(with: url.appendingPosterPath(path, quality: .medium))
        }
    }
}
