//
//  BasePresenter.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 12/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class BasePresenterImpl<T: BaseView> {
    
    internal weak var view: T?
    
    init(_ view: T) {
        self.view = view
    }
    
}
