//
//  RedirectViewControllerTests.swift
//  ios-mvp-pattern-exampleTests
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import XCTest
@testable import ios_mvp_pattern_example

class RedirectViewControllerTests: XCTestCase {

    var viewController: RedirectViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Root", bundle: Bundle.main)
        viewController = storyboard.instantiateInitialViewController() as! RedirectViewController
        viewController.injector = InjectorMock()
    }
    
    func testNavigateToMainStoryboardSetsRootViewControllerToWindow() {
        viewController.navigateToMainStoryboard()
        
        XCTAssertTrue(UIApplication.shared.defaultAppDelegate().window?.rootViewController is UINavigationController)
    }
    
    func testViewDidLoadLoadsConfigurationAndSetsRootViewControllerToWindow() {
        _ = viewController.view
        
        XCTAssertTrue(UIApplication.shared.defaultAppDelegate().window?.rootViewController is UINavigationController)
    }
    
}
