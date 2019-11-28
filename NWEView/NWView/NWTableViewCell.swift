//
//  NWTableViewCell.swift
//  SQLite
//
//  Created by Neal on 2019/11/7.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public class NWTableViewCell: UITableViewCell {
    
    var model: Any?

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var disPosableBag: [Disposable]? = []

    override public func removeFromSuperview() {
        
        if self.disPosableBag!.count > 0 {
            Disposables.create(self.disPosableBag!).dispose()
            self.disPosableBag!.removeAll()
        }
        
        self.disPosableBag = nil
        
        super.removeFromSuperview()
    }

}

extension NWExtensionWrapper where Base: UITableViewCell {
    
    public func setSelectStyle(_ style: UITableViewCell.SelectionStyle) -> NWExtensionWrapper {
        self.base.selectionStyle = style
        return self
    }   
    
}

extension NWExtensionWrapper where Base: NWTableViewCell {
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
}
