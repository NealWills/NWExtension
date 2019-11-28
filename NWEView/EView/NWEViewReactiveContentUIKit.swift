//
//  NWEViewReactiveC.swift
//  SQLite
//
//  Created by Neal on 2019/11/5.
//  Copyright © 2019 Neal. All rights reserved.
//

import Foundation

#if !os(macOS)

import UIKit

//MARK:- Return Base
extension NWExtensionWrapper where Base: UIView {
    
    public var individual: Base! {
        get {
            return self.base
        }
    }
//    public func individual() -> Base {
//        return self.base
//    }
}

//MARK:- add
extension NWExtensionWrapper where Base: UIView {
    public func addTo(_ subview: UIView) -> NWExtensionWrapper {
        subview.addSubview(self.base)
        return self
    }

}

//MARK:- Hidden && UserInterface
extension NWExtensionWrapper where Base: UIView {
    public func show(_ enabled: Bool) -> NWExtensionWrapper {
        self.base.isHidden = enabled
        return self
    }
    
    public func userInterface(_ enabled: Bool) -> NWExtensionWrapper {
        self.base.isUserInteractionEnabled = enabled
        return self
    }
}

//MARK:- layer
extension NWExtensionWrapper where Base: UIView {
    public func backgroundColor(_ color: UIColor) -> NWExtensionWrapper {
        self.base.backgroundColor = color
        return self
    }
    
    public func layer(_ cornerRadius: CGFloat?=nil, masksToBounds: Bool?=false) -> NWExtensionWrapper {
        self.base.layer.cornerRadius = cornerRadius ?? 0
        self.base.layer.masksToBounds = masksToBounds ?? false
        return self
    }
    
    public func border(_ borderColor: UIColor?=nil, borderWidth: CGFloat?=nil) -> NWExtensionWrapper {
        self.base.layer.borderColor = (borderColor ?? UIColor.clear).cgColor
        self.base.layer.borderWidth = borderWidth ?? 0
        return self
    }
    
    public func shadow(_ borderColor: UIColor?=nil, shadowOffset: CGSize?=nil, shadowRadius: CGFloat?=nil, shadowOpacity: Float?=0) -> NWExtensionWrapper {
        self.base.layer.shadowColor = (borderColor ?? UIColor.clear).cgColor
        self.base.layer.shadowOffset = shadowOffset ?? CGSize.zero
        self.base.layer.shadowRadius = shadowRadius ?? 0
        self.base.layer.shadowOpacity = shadowOpacity ?? 0
        return self
    }
    
}

//MARK:- Frame
extension NWExtensionWrapper where Base: UIView {
    public func setFrame(_ frame: CGRect) -> NWExtensionWrapper {
        self.base.frame = frame
        return self
    }
}


//MARK:- Size
extension NWExtensionWrapper where Base: UIView {
    func setWidth(_ width: CGFloat) -> NWExtensionWrapper {
        let size = self.base.frame.size
        self.base.frame.size = CGSize.init(width: width, height: size.height)
        return self
    }
    
    func setHeight(_ height: CGFloat) -> NWExtensionWrapper {
        let size = self.base.frame.size
        self.base.frame.size = CGSize.init(width: size.width, height: height)
        return self
    }
    
    func setSize(_ width: CGFloat?=nil, _ height: CGFloat?=nil) -> NWExtensionWrapper {
        let size = self.base.frame.size
        self.base.frame.size = CGSize.init(width: width ?? size.width, height: height ?? size.height)
        return self
    }
}

//MARK:- Origin
extension NWExtensionWrapper where Base: UIView {
    func setLeading(_ leading: CGFloat) -> NWExtensionWrapper {
        let origin = self.base.frame.origin
        self.base.frame.origin = CGPoint.init(x: leading, y: origin.y)
        return self
    }
    
    func setTop(_ top: CGFloat) -> NWExtensionWrapper {
        let origin = self.base.frame.origin
        self.base.frame.origin = CGPoint.init(x: origin.x, y: top)
        return self
    }
    
    func setOrigin(_ leading: CGFloat?=nil, _ top: CGFloat?=nil) -> NWExtensionWrapper {
        let origin = self.base.frame.origin
        self.base.frame.origin = CGPoint.init(x: leading ?? origin.x, y: top ?? origin.y)
        return self
    }
}

//MARK:- Destinate
extension NWExtensionWrapper where Base: UIView {
    func setTailing(_ tailing: CGFloat) -> NWExtensionWrapper {
        let origin = self.base.frame.origin
        let size = self.base.frame.size
        self.base.frame.origin = CGPoint.init(x: tailing - size.width, y: origin.y)
        return self
    }
    
    func setBottom(_ bottom: CGFloat) -> NWExtensionWrapper {
        let origin = self.base.frame.origin
        let size = self.base.frame.size
        self.base.frame.origin = CGPoint.init(x: origin.x, y: bottom - size.height)
        return self
    }
    
    func setDestination(_ tailing: CGFloat?=nil, _ bottom: CGFloat?=nil) -> NWExtensionWrapper {
        let origin = self.base.frame.origin
        let size = self.base.frame.size
        let destination = CGPoint.init(x: origin.x + size.width, y: origin.y + size.height)
        self.base.frame.origin = CGPoint.init(x: (tailing ?? destination.x) - size.width , y: (bottom ?? destination.y)  - size.height)
        return self
    }
 
}


#endif
