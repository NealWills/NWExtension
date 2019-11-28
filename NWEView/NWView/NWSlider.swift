//
//  NWSlider.swift
//  SQLite
//
//  Created by Neal on 2019/11/7.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public class NWSlider: UISlider {

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

extension NWExtensionWrapper where Base: UISlider {
    func setTrackTintColor(minimum: UIColor?=nil, maximun: UIColor?=nil) -> NWExtensionWrapper {
        
        if minimum != nil {
            self.base.minimumTrackTintColor = minimum
        }
        if maximun != nil {
            self.base.maximumTrackTintColor = maximun
        }

        return self
    }
    
    func setTrackImage(minimum: UIImage?=nil, maximun: UIImage?=nil, for state: UIControl.State) -> NWExtensionWrapper {
        if minimum != nil {
            self.base.setMinimumTrackImage(minimum, for: state)
        }
        if maximun != nil {
            self.base.setMaximumTrackImage(maximun, for: state)
        }
        return self
    }
    
    func setThumbImage(_ img: UIImage, for state: UIControl.State) -> NWExtensionWrapper {
        self.base.setThumbImage(img, for: state)
        return self
    }
}

extension NWExtensionWrapper where Base: NWSlider {
    func addObs(obs:@escaping (NWSlider)->()) -> NWExtensionWrapper {
        let disObs = self.base.rx.value.asObservable()
            .subscribe(onNext: { (_) in
                obs(self.base)
            })
        self.base.disPosableBag?.append(disObs)
        return self
    }
}
