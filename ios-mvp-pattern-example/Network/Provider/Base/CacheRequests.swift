//
//  CacheRequests.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 2/4/17.
//  Copyright © 2018 Ivan Podbika. All rights reserved.
//

import Foundation
import Alamofire

protocol CacheRequests {
    
    /// Cache request for managing api calls.
    ///
    /// - Parameter request: Request instance.
    func cache(request: Request)
    
    /// Remove cached request.
    ///
    /// - Parameter request: Request to be removed.
    func removeCached(request: Request)
    
    /// Clear cached requests and cancel them.
    func cancelRequests()
    
}
