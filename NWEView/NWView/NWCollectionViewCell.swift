//
//  NWCollectionViewCell.swift
//  SQLite
//
//  Created by Neal on 2019/11/7.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit

class NWCollectionViewCell: UICollectionViewCell {
    
    var model: Any?
    
}

extension NWExtensionWrapper where Base: NWCollectionViewCell {
    
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
    
}
