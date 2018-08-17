//
//  ConfigurationDataProviderMock.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
@testable import ios_mvp_pattern_example

class ConfigurationDataProviderMock: ConfigurationDataProvider {
    
    var apiConfigurationResponse: APIConfiguration?
    var error: Error?
    
    override func loadConfiguration(completion: @escaping (APIConfiguration?, Error?) -> ()) {
        completion(apiConfigurationResponse, error)
    }
    
}
