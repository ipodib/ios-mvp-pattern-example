//
//  InjectorMock.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
@testable import ios_mvp_pattern_example

class InjectorMock: Injector {
    
    override func provideConfigurationDataProvider() -> ConfigurationDataProvider {
        return ConfigurationDataProviderMock()
    }
    
    override func providerSearchDataProvider() -> SearchDataProvider {
        return SearchDataProviderMock()
    }
    
}
