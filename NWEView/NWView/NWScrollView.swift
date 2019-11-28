//
//  NWScrollView.swift
//  SQLite
//
//  Created by Neal on 2019/11/7.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit

class NWScrollView: UIScrollView {

    var model: Any?

}

extension NWExtensionWrapper where Base: UIScrollView {
    
    public func setContentSize(_ size: CGSize) -> NWExtensionWrapper {
        self.base.contentSize = size
        return self
    }
    
    public func setShowScrollIndicator(vertical: Bool?=nil, horizontal: Bool?=nil) -> NWExtensionWrapper {
        if vertical != nil {
            self.base.showsVerticalScrollIndicator = vertical!
        }
        if horizontal != nil {
            self.base.showsHorizontalScrollIndicator = horizontal!
        }
        return self
    }
    
    func setBounces(_ enable: Bool) -> NWExtensionWrapper {
        self.base.bounces = enable
        return self
    }
}

extension NWExtensionWrapper where Base: NWScrollView {
    
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
    
}
