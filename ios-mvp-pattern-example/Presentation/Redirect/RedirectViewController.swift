//
//  RootViewController.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class RedirectViewController: UIViewController {
    
    private var presenter: RedirectPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RedirectPresenterImpl(self, ConfigurationDataProvider(),
                                          dataStore: LocalDataStore())
        presenter?.loadConfiguration()
    }
    
}

extension RedirectViewController: RedirectView {
    
    func navigateToMainStoryboard() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let window = UIApplication.shared.defaultAppDelegate().window
        window?.rootViewController = storyboard.instantiateInitialViewController()
    }
    
}
