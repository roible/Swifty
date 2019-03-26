//
//  Identifierible.swift
//  Swifty
//
//  Created by roy on 2019/3/13.
//

import Foundation

public protocol Identifierible {}

extension Identifierible {
    public static var identifier: String {
        return "\(Self.self)"
    }
}

extension SwiftyWrapper where Base: Any {
    public static var identifier: String {
        return "\(Base.self)"
    }
}
