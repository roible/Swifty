//
//  ViewChainable.swift
//  Swifty
//
//  Created by roy on 2019/4/9.
//

#if os(iOS)
import UIKit
typealias View = UIView
#elseif os(macOS)
import AppKit
typealias View = NSView
#endif

import Foundation

protocol ViewChainable {}

extension ViewChainable where Self: View {
    @discardableResult
    func added(to superView: View) -> Self {
        superView.addSubview(self)
        return self
    }
    
    @discardableResult
    func config(_ configClosure: (Self) -> Void) -> Self {
        configClosure(self)
        return self
    }
}

extension View: ViewChainable {}
