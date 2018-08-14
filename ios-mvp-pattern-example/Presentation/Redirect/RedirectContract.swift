//
//  RedirectContract.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol RedirectView: BaseView {
    
    /// Navigate to main screen.
    func navigateToMainStoryboard()
    
}

protocol RedirectPresenter {
    
    /// Load system wide configuration.
    func loadConfiguration()
    
}
