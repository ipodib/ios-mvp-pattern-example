//
//  Collection.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieCollection: Mappable {
    
    var id: Int?
    var name: String?
    var posterPath: String?
    var backdropPath: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["poster_path"]
        backdropPath <- map["backdrop_path"]
    }
    
}
