//
//  UIScreenEx.swift
//  Swifty iOS
//
//  Created by roy on 2019/4/14.
//

import UIKit

extension UIScreen {
    enum InchSize {
        /// 3.5 inch iPhone (4, 4S)
        case inch_3_5

        /// 4.0 inch iPhone (5, 5S, 5C, SE)
        case inch_4_0
        
        /// 4.7 inch iPhone (6, 7, 8)
        case inch_4_7
        
        /// 5.5 inch iPhone (6+, 7+, 8+)
        case inch_5_5
        
        /// 5.8 inch iPhone (X, XS)
        case inch_5_8
        
        /// 6.1 inch iPhone (XR)
        case inch_6_1
        
        /// 6.5 inch iPhone (XS Max)
        case inch_6_5
        
        /// 9.7 inch iPad
        case inch_9_7
        
        /// 10.5 inch iPad
        case inch_10_5
        
        /// 12.9 inch iPad
        case inch_12_9
        
        /// Couldn't determine device
        case unknown
        
        init() {
            let screenLongestSide = max(main.bounds.width, main.bounds.height)
            
            switch screenLongestSide {
            case 480:
                self = .inch_3_5
            case 568:
                self = .inch_4_0
            case 667:
                self = .inch_4_7
            case 736:
                self = .inch_5_5
            case 812:
                self = .inch_5_8
            case 896:
                self = 3 == main.scale ? .inch_6_5 : .inch_6_1
            case 1024:
                self = .inch_9_7
            case 1112:
                self = .inch_10_5
            case 1366:
                self = .inch_12_9
            default:
                self = .unknown
            }
        }
        
        static var currentSize: InchSize {
            return InchSize()
        }
    }
}
