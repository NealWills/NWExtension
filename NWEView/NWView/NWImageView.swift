//
//  NWImageView.swift
//  SQLite
//
//  Created by Neal on 2019/11/7.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NWImageView: UIImageView {
    
    var model: Any?

//    var disPosableBag: [Disposable]? = []
//
//    override func removeFromSuperview() {
//        
//        if self.disPosableBag!.count > 0 {
//            Disposables.create(self.disPosableBag!).dispose()
//            self.disPosableBag!.removeAll()
//        }
//        
//        self.disPosableBag = nil
//        
//        super.removeFromSuperview()
//        
//    }

}

extension NWExtensionWrapper where Base: UIImageView {
    
    public func setImage(_ img: UIImage) -> NWExtensionWrapper {
        self.base.image = img
        return self
    }
    
    public func setAnimateImage(_ imgs: [UIImage]) -> NWExtensionWrapper {
        self.base.animationImages = imgs
        return self
    }
    
}

extension NWExtensionWrapper where Base: NWImageView {
    
    func setModel<T>(_ model: T) -> NWExtensionWrapper {
        self.base.model = model
        return self
    }
    
}


