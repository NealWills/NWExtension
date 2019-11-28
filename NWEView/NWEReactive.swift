//
//  ECGReactive.swift
//  
//
//  Created by Neal on 2019/10/13.
//

import Foundation

#if !os(macOS)
import UIKit
#else
import AppKit
#endif

//1.定义一个协议
public protocol NWEReactiveCompatible: AnyObject { }

//2.定义一个结构体
public struct NWExtensionWrapper<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

//3.拓展协议 添加属性
extension NWEReactiveCompatible {
    
    public var nw: NWExtensionWrapper<Self> {
        get { return NWExtensionWrapper.init(self) }
        set { }
    }
    
}

#if !os(macOS)
extension UIView: NWEReactiveCompatible {}
#else
extension NSView: ECGReactiveCompatible {}
#endif


