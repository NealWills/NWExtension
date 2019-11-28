//
//  NWLabel.swift
//  SQLite
//
//  Created by Neal on 2019/11/6.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NWLabel: UILabel {
    var model: Any?
}

extension NWExtensionWrapper where Base: UILabel {
    func setTitle(_ text: String, foregroundColor: UIColor) -> NWExtensionWrapper {
        self.base.text = text
        self.base.textColor = foregroundColor
        return self
    }
    
    func setFont(_ font: UIFont) -> NWExtensionWrapper {
        self.base.font = font
        return self
    }
    
    func setTextAlignment(_ alignment: NSTextAlignment) -> NWExtensionWrapper {
        self.base.textAlignment = alignment
        return self
    }
    
    
}

extension NWExtensionWrapper where Base: NWLabel {
    
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
    
}
