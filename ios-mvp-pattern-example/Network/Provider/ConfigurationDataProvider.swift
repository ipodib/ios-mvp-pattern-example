//
//  ConfigurationDataProvider.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class ConfigurationDataProvider: DataProvider {
    
    /// Load system wide configuration.
    ///
    /// - Parameter completion: Completion handler.
    func loadConfiguration(completion: @escaping (_ response: APIConfiguration?, _ error: Error?) -> ()) {
        execute(request: ConfigurationRouter.loadConfiguration, completion: completion)
    }
    
}
