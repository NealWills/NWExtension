//
//  NWCollectionView.swift
//  SQLite
//
//  Created by Neal on 2019/11/7.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit

class NWCollectionView: UICollectionView {

    var model: Any?

}

extension NWExtensionWrapper where Base: UICollectionView {
    
    func regist(cell cellId: String?=nil, header headerid: String?=nil, footer footerId: String?=nil) -> NWExtensionWrapper {
        if cellId != nil {
            self.base.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId!)
        }
        
        if headerid != nil {
            self.base.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerid!)
        }
        
        if footerId != nil {
            self.base.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId!)
        }
        
        return self
    }
    
    func setDelegate(_ classV: UIResponder) -> NWExtensionWrapper {
        self.base.delegate = (classV as! UICollectionViewDelegate)
        self.base.dataSource = (classV as! UICollectionViewDataSource)
        return self
    }

}

extension NWExtensionWrapper where Base: NWCollectionView {
    
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
    
}
