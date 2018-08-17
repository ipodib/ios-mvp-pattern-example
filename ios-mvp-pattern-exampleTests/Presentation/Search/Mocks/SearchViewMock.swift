//
//  SearchViewMock.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
@testable import ios_mvp_pattern_example

class SearchViewMock: SearchView {

    var resultsToDisplay = [SearchResultItem]()
    var infoMessage: String?
    
    func display(results: [SearchResultItem]) {
        resultsToDisplay = results
    }
    
    func displaySearchInfo(message: String) {
        infoMessage = message
    }
    
}
