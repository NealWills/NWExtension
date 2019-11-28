//
//  NWTextField.swift
//  SQLite
//
//  Created by Neal on 2019/11/6.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NWTextField: UITextField {
    
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

extension NWExtensionWrapper where Base : NWTextField {
    func textObs(_ action:@escaping (Base)->()) -> NWExtensionWrapper {
        let disObs = self.base.rx.text
            .asObservable()
            .subscribe(onNext: { (text) in
                action(self.base)
            })
        self.base.disPosableBag?.append(disObs)
        return self
    }
    
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
}

extension NWExtensionWrapper where Base: UITextField {
    func setText(_ text: String?=nil, foregroundColor: UIColor) -> NWExtensionWrapper {
        if text != nil {
            self.base.text = text
        }
        self.base.textColor = foregroundColor
        return self
    }
    
    func setPlaceholder(_ placeholder: String, font: UIFont?=nil, color: UIColor?=nil) -> NWExtensionWrapper {
        
        let font = font ?? UIFont.systemFont(ofSize: 16)
        let color = color ?? UIColor.lightGray
        let attributePlaceholder = NSMutableAttributedString.init(string: placeholder)
        attributePlaceholder.setAttributes([NSAttributedString.Key.font:font, NSAttributedString.Key.foregroundColor: color], range: .init(location: 0, length: placeholder.count))
        self.base.attributedPlaceholder = attributePlaceholder

        return self
    }
    
    func setFont(_ font: UIFont) -> NWExtensionWrapper {
        self.base.font = font
        return self
    }
    
    func setLeftView(_ view: UIView, mode: UITextField.ViewMode) -> NWExtensionWrapper {
        self.base.leftView = view
        self.base.leftViewMode = mode
        return self
    }
    
    func setRightView(_ view: UIView, mode: UITextField.ViewMode) -> NWExtensionWrapper {
        self.base.rightView = view
        self.base.rightViewMode = mode
        return self
    }
    
}
