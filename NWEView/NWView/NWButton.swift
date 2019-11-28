//
//  NWButton.swift
//  SQLite
//
//  Created by Neal on 2019/11/6.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NWButton: UIButton {
    
    var model: Any?

    var disPosableBag: [Disposable]? = []

    override func removeFromSuperview() {
        
        if self.disPosableBag!.count > 0 {
            Disposables.create(self.disPosableBag!).dispose()
            self.disPosableBag!.removeAll()
        }
        
        self.disPosableBag = nil
        
        super.removeFromSuperview()
    }

}

extension NWExtensionWrapper where Base : NWButton {
    
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
    
    func addTap(action:@escaping (NWButton)->()) -> NWExtensionWrapper {
        let disposable = self.base.rx.tap
            .subscribe(onNext: { (_) in
                action(self.base)
            })
        self.base.disPosableBag!.append(disposable)
        return self
    }

}

extension NWExtensionWrapper where Base: UIButton {
    func setAttribute(title: String?=nil, foregroundColor: UIColor?=nil, img: UIImage?=nil, for state: UIControl.State) -> NWExtensionWrapper {
        
        if title != nil {
            self.base.setTitle(title!, for: state)
        }
        
        if foregroundColor != nil {
            self.base.setTitleColor(foregroundColor!, for: state)
        }
        
        if img != nil {
            self.base.setImage(img!, for: state)
        }
        
        return self
    }
    
    func setFont(_ font: UIFont) -> NWExtensionWrapper {
        self.base.titleLabel?.font = font
        return self
    }
    
}
