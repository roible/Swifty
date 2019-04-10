//
//  ColorAsset.swift
//  Swifty
//
//  Created by roy on 2019/4/10.
//

import Foundation

#if os(OSX)
import AppKit
public typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
import UIKit
public typealias Color = UIColor
#endif

public struct ColorAsset {
    fileprivate var name: String
    
    #if swift(>=3.2)
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
    public var color: Color {
        return Color(asset: self)
    }
    #endif
}

extension Color {
    #if swift(>=3.2)
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
    public convenience init!(asset: ColorAsset) {
        let bundle = Bundle(for: BundleToken.self)
        #if os(iOS) || os(tvOS)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
        self.init(named: asset.name, bundle: bundle)
        #elseif os(watchOS)
        self.init(named: asset.name)
        #endif
    }
    #endif
}
