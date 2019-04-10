//
//  ImageAssetable.swift
//  Swifty
//
//  Created by roy on 2019/4/10.
//

import Foundation

#if os(OSX)
import AppKit.NSImage
public typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
import UIKit.UIImage
public typealias Image = UIImage
#endif

public protocol ImageAssetable: RawRepresentable, CaseIterable where Self.RawValue == String {
    var bundle: Bundle? { get }
}

extension ImageAssetable {
    var bundle: Bundle? {
        #if os(OSX)
        return Bundle(for: BundleToken.self)
        #else
        return nil
        #endif
    }
    
    public var image: Image {
        
        #if os(iOS) || os(tvOS)
        let image = Image(named: rawValue, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
        let image = Bundle(for: BundleToken.self).image(forResource: rawValue)
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
        #if os(iOS) || os(tvOS)
        let images = Self.allCases.compactMap {
            Image(named: $0.rawValue, in: $0.bundle, compatibleWith: nil)
        }
        #elseif os(OSX)
        let images = Self.allCases.compactMap {
            Bundle(for: BundleToken.self).image(forResource: $0.rawValue)
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
