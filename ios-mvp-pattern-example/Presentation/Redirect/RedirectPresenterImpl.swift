//
//  RedirectPresenterImpl.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class RedirectPresenterImpl<T: RedirectView>: BasePresenterImpl<T>, RedirectPresenter {
    
    private let dataProvider: ConfigurationDataProvider
    private let dataStore: LocalDataStore
    
    init(_ view: T, _ dataProvider: ConfigurationDataProvider, dataStore: LocalDataStore) {
        self.dataProvider = dataProvider
        self.dataStore = dataStore
        super.init(view)
    }
    
    func loadConfiguration() {
        dataProvider.loadConfiguration(completion: dataConfigurationLoaded(_:_:))
    }
    
    private func dataConfigurationLoaded(_ config: APIConfiguration?, _ error: Error?) {
        if let config = config {
            dataStore.save(config)
        }
        view?.navigateToMainStoryboard()
    }
}
