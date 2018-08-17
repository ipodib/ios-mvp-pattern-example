//
//  JSONLoader.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
@testable import ios_mvp_pattern_example

class JSONLoader {
    
    class func loadAPIConfiguration() -> APIConfiguration? {
        return APIConfiguration(JSONString: loadJSONString(name: "api_configuration"))
    }
    
    class func loadMovie() -> Movie? {
        return Movie(JSONString: loadJSONString(name: "movie"))
    }
    
    class func loadSearchResults() -> SearchResult? {
        return SearchResult(JSONString: loadJSONString(name: "search_results"))
    }
    
    class func loadJSONString(name: String) -> String {
        let bundle = Bundle(for: self)
        let path = bundle.path(forResource: name, ofType: "json")
        return try! String(contentsOfFile: path!)
    }
    
}
