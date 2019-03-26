//
//  Swifty.swift
//  Swifty
//
//  Created by roy on 2019/3/13.
//

import Foundation

public struct SwiftyWrapper<Base> {
    public let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}

public protocol SwiftyCompatible {}

extension SwiftyCompatible {
    // swiftlint:disable identifier_name
    public var sf: SwiftyWrapper<Self> {
        return SwiftyWrapper(self)
    }
}
