//
//  ColorExtensions.swift
//  banco modalmais test
//
//  Created by zied on 25/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit

fileprivate class BancoModalColors { }

extension UIColor {
    
    /// A color object whose hex value is #EBECEE and whose alpha value is 1.0.
    public class var lightGray: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "light_gray", in: Bundle(for: BancoModalColors.self), compatibleWith: nil)!
        } else {
            return #colorLiteral(red: 0.9215686275, green: 0.9254901961, blue: 0.9333333333, alpha: 1)
        }
    }
    
    /// A color object whose hex value is #64FFDA and whose alpha value is 1.0.
    public class var lightGreen: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "light_green", in: Bundle(for: BancoModalColors.self), compatibleWith: nil)!
        } else {
            return #colorLiteral(red: 0.3921568627, green: 1, blue: 0.8549019608, alpha: 1)
        }
    }
    
    /// A color object whose hex value is #7E7E7E and whose alpha value is 1.0.
    public class var mediumGray: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "medium_gray", in: Bundle(for: BancoModalColors.self), compatibleWith: nil)!
        } else {
            return #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1)
        }
    }
    
    /// A color object whose hex value is #242528 and whose alpha value is 1.0.
    public class var darkGray: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "dark_gray", in: Bundle(for: BancoModalColors.self), compatibleWith: nil)!
        } else {
            return #colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1568627451, alpha: 1)
        }
    }
    
}
