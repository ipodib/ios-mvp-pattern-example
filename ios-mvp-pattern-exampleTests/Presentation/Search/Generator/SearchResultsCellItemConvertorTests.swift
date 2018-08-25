//
//  SearchResultsCellItemConvertorTests.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import XCTest
@testable import ios_mvp_pattern_example

class SearchResultsCellItemConvertorTests: XCTestCase {
    
    var convertor: SearchResultsCellItemConvertor!
    
    override func setUp() {
        super.setUp()
        convertor = SearchResultsCellItemConvertor()
    }
    
    func testConvertReturnsEmptyArray() {
        XCTAssertTrue(convertor.convert(from: []).isEmpty)
    }
    
    func testConvertReturnsSearchResultItem() {
        let movie = JSONLoader.loadMovie()!
        
        let result = convertor.convert(from: [movie])
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.cellIdentifier, SearchResultTableViewCell.cellIdentifier)
        XCTAssertEqual(result.first?.overview, movie.overview)
        XCTAssertEqual(result.first?.posterPath, movie.posterPath)
        XCTAssertEqual(result.first?.title, movie.title)
    }
    
}
