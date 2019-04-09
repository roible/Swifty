//
//  ViewChainable.swift
//  Swifty
//
//  Created by roy on 2019/4/9.
//

#if os(iOS)
import UIKit
public typealias View = UIView
#elseif os(macOS)
import AppKit
public typealias View = NSView
#endif

import Foundation

public protocol ViewChainable {}

extension ViewChainable where Self: View {
    @discardableResult
    public func added(to superView: View) -> Self {
        superView.addSubview(self)
        return self
    }
    
    @discardableResult
    public func config(_ configClosure: (Self) -> Void) -> Self {
        configClosure(self)
        return self
    }
}

extension View: ViewChainable {}
