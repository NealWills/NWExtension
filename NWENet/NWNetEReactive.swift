
import Foundation

//定义一个协议
public protocol NWNetEReactiveCompatible: AnyObject {
    
}

//2.定义一个结构体
public struct NWNetExtensionWrapper<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
    
   
}

//3.拓展协议 添加属性
extension NWNetEReactiveCompatible {
    
    public var nw: NWNetExtensionWrapper<Self> {
        get { return NWNetExtensionWrapper.init(self) }
        set { }
    }
    
}

extension NWENetCore: NWNetEReactiveCompatible {
    
}
