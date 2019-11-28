//
//  ECGReactiveContentUIKit.swift
//  
//
//  Created by Neal on 2019/10/13.
//

import Foundation

#if !os(macOS)

import UIKit

extension NWExtensionWrapper where Base: UIView {
    
    //MARK:- Size
    /// width
    public var width: CGFloat {
        set {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: origin.x, y: origin.y, width: newValue, height: size.height)
        }
        get {
            return self.base.frame.size.width
        }
    }
    
    /// height
    public var height: CGFloat {
        set {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: origin.x, y: origin.y, width: size.width, height: newValue)
        }
        get {
            return self.base.frame.size.height
        }
    }
    
    /// Size
    public var size: CGSize {
        set {
            let origin = self.base.frame.origin
            self.base.frame = CGRect.init(x: origin.x, y: origin.y, width: newValue.width, height: newValue.height)
        }
        get {
            return self.base.frame.size
        }
    }
    
    //MARK:- Origin
    /// leading
    public var leading: CGFloat {
        set {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: newValue, y: origin.y, width: size.width, height: size.height)
        }
        get {
            return self.base.frame.origin.x
        }
    }
    
    /// topping
    public var topping: CGFloat {
        set {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: origin.x, y: newValue, width: size.width, height: size.height)
        }
        get {
            return self.base.frame.origin.y
        }
    }
    
    /// origin
    public var origin: CGPoint {
        set {
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: newValue.x, y: newValue.y, width: size.width, height: size.height)
        }
        get {
            return self.base.frame.origin
        }
    }
    
    
    //MARK:- Destinate
    /// tailing
    public var tailing: CGFloat {
        set {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: origin.x, y: origin.y, width: newValue - origin.x, height: size.height)
        }
        get {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            return origin.x + size.width
        }
    }
    
    /// bottom
    public var bottom: CGFloat {
        set {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: origin.x, y: origin.y, width: size.width, height: newValue - origin.y)
        }
        get {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            return origin.y + size.height
        }
    }
    
    /// destinate
    public var destinate: CGPoint {
        set {
            let origin = self.base.frame.origin
            self.base.frame = CGRect.init(x: origin.x, y: origin.y, width: newValue.x - origin.x, height: newValue.y - size.height)
        }
        get {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            return CGPoint.init(x: origin.x + size.width, y: origin.y + size.height)
        }
    }
    
    //MARK:- Center
    /// centerX
    public var centerX: CGFloat {
        set {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: newValue - size.width / 2.0, y: origin.y, width: size.width, height: size.height)
        }
        get {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            return origin.x + size.width / 2.0
        }
    }
    
    /// bottom
    public var centerY: CGFloat {
        set {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: origin.x, y:  newValue - size.height / 2.0, width: size.width, height: size.height)
        }
        get {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            return origin.y + size.height / 2.0
        }
    }
    
    /// destinate
    public var center: CGPoint {
        set {
            let size = self.base.frame.size
            self.base.frame = CGRect.init(x: newValue.x - size.width / 2.0, y: newValue.y - size.height / 2.0, width: size.width, height: size.height)
        }
        get {
            let origin = self.base.frame.origin
            let size = self.base.frame.size
            return CGPoint.init(x: origin.x + size.width / 2.0, y: origin.y + size.height / 2.0)
        }
    }
    
}


extension NWExtensionWrapper where Base: UIView {
    
    //MARK:- Coordinate
    /// Abscissa
    /// - Parameter block: block in equals
    /// - Parameter Equals: equalization to blocks
    public func locAbscissa(_ block: CGFloat, in Equals: CGFloat) -> CGFloat {
        let origin = self.base.frame.origin
        let size = self.base.frame.size
        return origin.x + size.width / Equals * block
    }
    
    /// Ordinate
    /// - Parameter block: block in equals
    /// - Parameter Equals: equalization to blocks
    public func locOrdinate(_ block: CGFloat, in Equals: CGFloat) -> CGFloat {
        let origin = self.base.frame.origin
        let size = self.base.frame.size
        return origin.y + size.height / Equals * block
    }
    
    /// coordinate
    /// - Parameter block: block in equals
    /// - Parameter Equals: equalization to blocks
    public func coordinate(_ block: CGFloat, in Equals: CGFloat) -> CGPoint {
        let origin = self.base.frame.origin
        let size = self.base.frame.size
        return CGPoint.init(x: origin.x + size.width / Equals * block, y: origin.y + size.height / Equals * block)
    }
    
    //MARK:- dimension
    public func sizeHorizontal(_ blocks: CGFloat, in Equals: CGFloat) -> CGFloat {
        let size = self.base.frame.size
        return size.width / Equals * blocks
    }
    
    public func sizeVertical(_ blocks: CGFloat, in Equals: CGFloat) -> CGFloat {
        let size = self.base.frame.size
        return size.height / Equals * blocks
    }
    
    public func dimension(_ blocks: CGFloat, in Equals: CGFloat) -> CGSize {
        let size = self.base.frame.size
        return CGSize.init(width: size.width / Equals * blocks, height: size.height / Equals * blocks)
    }
    
}




#endif
