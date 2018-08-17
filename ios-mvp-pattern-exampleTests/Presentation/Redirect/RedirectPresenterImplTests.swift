//
//  RedirectPresenterImplTests.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import XCTest
@testable import ios_mvp_pattern_example

class RedirectPresenterImplTests: XCTestCase {
    
    var presenter: RedirectPresenter!
    var redirectViewMock: RedirectViewMock!
    var dataStore: LocalDataStore!
    var dataProvider: ConfigurationDataProviderMock!
    
    override func setUp() {
        super.setUp()
        redirectViewMock = RedirectViewMock()
        dataStore = LocalDataStore()
        dataProvider = ConfigurationDataProviderMock()
        presenter = RedirectPresenterImpl(redirectViewMock, dataProvider, dataStore: dataStore)
    }
    
    func testLoadConfigurationNavigatesToNextScreen() {
        dataProvider.apiConfigurationResponse = JSONLoader.loadAPIConfiguration()
        
        presenter.loadConfiguration()
        
        XCTAssertTrue(redirectViewMock.navigateToMainStoryboardExecuted)
    }
    
    func testLoadConfigurationNavigatesToNextScreenWithErrorResponse() {
        dataProvider.error = NSError(domain: "", code: 0, userInfo: nil)
        
        presenter.loadConfiguration()
        
        XCTAssertTrue(redirectViewMock.navigateToMainStoryboardExecuted)
    }
    
    func testLoadConfigurationSavesConfig() {
        dataProvider.apiConfigurationResponse = JSONLoader.loadAPIConfiguration()
        
        presenter.loadConfiguration()
        
        let config = dataStore.apiConfig
        XCTAssertNotNil(config)
        XCTAssertEqual(config?.changeKeys?.count, 53)
        XCTAssertEqual(config?.images?.baseUrl?.absoluteString, "http://image.tmdb.org/t/p/")
        XCTAssertEqual(config?.images?.secureBaseUrl?.absoluteString, "https://image.tmdb.org/t/p/")
        XCTAssertEqual(config?.images?.backdropSizes?.count, 4)
        XCTAssertEqual(config?.images?.logoSizes?.count, 7)
        XCTAssertEqual(config?.images?.posterSizes?.count, 7)
        XCTAssertEqual(config?.images?.profileSizes?.count, 4)
        XCTAssertEqual(config?.images?.stillSizes?.count, 4)
    }
    
}
