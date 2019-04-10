//
//  ImageAssetable.swift
//  Swifty
//
//  Created by roy on 2019/4/10.
//

import Foundation

#if os(OSX)
import AppKit.NSImage
public typealias AssetColor = NSColor
public typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
import UIKit.UIImage
public typealias AssetColor = UIColor
public typealias Image = UIImage
#endif

public protocol ImageAssetable: RawRepresentable, CaseIterable where Self.RawValue == String {}

extension ImageAssetable {
    public var image: Image {
        let bundle = Bundle(for: BundleToken.self)
        
        #if os(iOS) || os(tvOS)
        let image = Image(named: rawValue, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
        let image = bundle.image(forResource: rawValue)
        #elseif os(watchOS)
        let image = Image(named: rawValue)
        #endif
        guard
            let result = image
            else {
                fatalError("Unable to load image named \(rawValue).")
        }
        
        return result
    }
    
    public static var images: [Image] {
        let bundle = Bundle(for: BundleToken.self)
        
        #if os(iOS) || os(tvOS)
        let images = Self.allCases.compactMap {
            Image(named: $0.rawValue, in: bundle, compatibleWith: nil)
        }
        #elseif os(OSX)
        let images = Self.allCases.compactMap {
            bundle.image(forResource: $0.rawValue)
        }
        #elseif os(watchOS)
        let images = Self.allCases.compactMap {
            Image(named: $0.rawValue)
        }
        #endif
        
        return images
    }
}

public final class BundleToken {}
