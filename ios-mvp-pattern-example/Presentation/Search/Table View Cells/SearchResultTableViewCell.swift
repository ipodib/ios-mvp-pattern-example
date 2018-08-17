//
//  SearchResultTableViewCell.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 12/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit
import Kingfisher

class SearchResultTableViewCell: UITableViewCell, ConfigurableTableViewCell {

    static let cellIdentifier = "SearchResultTableViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!

    func configure(_ item: TableViewCellItem) {
        guard let item = item as? SearchResultItem else {
            return
        }
        
        titleLabel.text = item.title
        descriptionLabel.text = item.overview
        posterImageView.loadPoster(with: item.posterPath)
    }
    
    override func prepareForReuse() {
        posterImageView.image = nil
    }
    
}
