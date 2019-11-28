//
//  NWTableview.swift
//  SQLite
//
//  Created by Neal on 2019/11/7.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit

class NWTableview: UITableView {

    var model: Any?

}

extension NWExtensionWrapper where Base: UITableView {
    
    
    func setDelegate(_ classV: UIResponder) -> NWExtensionWrapper {
        self.base.delegate = (classV as! UITableViewDelegate)
        self.base.dataSource = (classV as! UITableViewDataSource)
        return self
    }
    
    func setHeader(_ header: UIView) -> NWExtensionWrapper {
        self.base.tableHeaderView = header
        return self
    }
    
    func setFooter(_ footer: UIView) -> NWExtensionWrapper {
        self.base.tableFooterView = footer
        return self
    }
    
}

extension NWExtensionWrapper where Base: NWTableview {
    
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
    
}
