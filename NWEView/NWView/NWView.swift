//
//  NWView.swift
//  SQLite
//
//  Created by Neal on 2019/11/6.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit



class NWView: UIView {
    var model: Any?
}

extension NWExtensionWrapper where Base: NWView {
    
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
    
}
