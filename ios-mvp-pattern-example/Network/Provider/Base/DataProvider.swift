//
//  ServerDataProvider.swift
//  home-assitant
//
//  Created by Ivan Podibka on 11/8/16.
//  Copyright © 2018 Ivan Podbika. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class DataProvider {
    
    private let sessionManager: SessionManager
    fileprivate var cachedRequests = [Request]()
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        self.init(SessionManager(configuration: configuration))
    }
    
    /// Initialize data provider with session manager.
    ///
    /// - Parameter sessionManager: Configured session manager.
    init(_ sessionManager: SessionManager) {
        self.sessionManager = sessionManager
        self.sessionManager.startRequestsImmediately = false
    }
    
    /// Execute request with object response.
    ///
    /// - Parameters:
    ///   - request: Request to be executed.
    ///   - completion: Completion handler with response object.
    func execute<T : Mappable>(request: URLRequestConvertible, completion: @escaping (_ response: T?, _ error: Error?) -> ()) {
        let dataRequest = sessionManager.request(request)
        cache(request: dataRequest)
        
        dataRequest.validate().responseObject {[weak self] (response: DataResponse<T>) in
            completion(response.result.value, response.result.error)
            self?.removeCached(request: dataRequest)
        }
        
        dataRequest.resume()
    }
    
    
    /// Execute request with list response.
    ///
    /// - Parameters:
    ///   - request: Request to be called.
    ///   - completion: Completion handler with response list.
    func execute<T : Mappable>(request: URLRequestConvertible, completion: @escaping (_ response: [T]?, _ error: Error?) -> ()) {
        let dataRequest = sessionManager.request(request)
        cache(request: dataRequest)
        
        dataRequest.validate().responseArray {[weak self] (response: DataResponse<[T]>) in
            completion(response.result.value, response.result.error)
            self?.removeCached(request: dataRequest)
        }
        
        dataRequest.resume()
    }

    
    /// Execute request with no response.
    ///
    /// - Parameters:
    ///   - request: Request to be called.
    ///   - completion: Completion handler.
    func execute(request: URLRequestConvertible, completion: @escaping (_ error: Error?) -> ()) {
        let dataRequest = sessionManager.request(request)
        cache(request: dataRequest)
        
        dataRequest.validate().responseString {[weak self] (response) in
            completion(response.result.error)
            self?.removeCached(request: dataRequest)
        }
        
        dataRequest.resume()
    }
}

extension DataProvider: CacheRequests {
    
    func cache(request: Request) {
        cachedRequests.append(request)
    }
    
    func removeCached(request: Request) {
        let index = cachedRequests.index { (oldRequest) -> Bool in
            return oldRequest === request
        }
        
        if let index = index {
            cachedRequests.remove(at: index)
        }
    }
    
    func cancelRequests() {
        for request in cachedRequests {
            request.cancel()
        }
        cachedRequests.removeAll()
    }
    
}
