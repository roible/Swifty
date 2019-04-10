//
//  ImageExtension.swift
//  Swifty
//
//  Created by roy on 2019/4/10.
//

import Foundation

// MARK: Image Extension
extension Image {
    @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
    @available(OSX, deprecated, message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    public convenience init!<T>(asset: T) where T: ImageAssetable {
        #if os(iOS) || os(tvOS)
        let bundle = Bundle(for: BundleToken.self)
        self.init(named: asset.rawValue, in: bundle, compatibleWith: nil)
        #elseif os(OSX) || os(watchOS)
        self.init(named: asset.rawValue)
        #endif
    }
}
