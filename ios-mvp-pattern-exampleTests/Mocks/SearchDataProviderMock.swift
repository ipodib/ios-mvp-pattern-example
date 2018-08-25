//
//  SearchDataProviderMock.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
@testable import ios_mvp_pattern_example

class SearchDataProviderMock: SearchDataProvider {
    
    var searchResultResponse: SearchResult?
    var error: Error?
    
    override func search(_ query: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        completion(searchResultResponse, error)
    }
    
}
