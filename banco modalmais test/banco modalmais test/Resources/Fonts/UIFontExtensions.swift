//
//  UIFontExtensions.swift
//  banco modalmais test
//
//  Created by zied on 25/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit

fileprivate class BancoModalFonts { }

extension UIFont {
    
    /// banco modal weight
    ///
    /// - regular: Regular weight
    /// - semibold: Semibold weight
    public enum BancoModalWeight: CaseIterable {
        case arial_narrow_regular
        case arial_narrow_bold
        case arial_narrow_bolditalic
        case montserrat_semi_bold_Italic
        case roboto_regular
        // MARK: INTERNAL PROPERTIES
        
        var fontName: String {
            switch self {
            case .arial_narrow_regular: return "arial_narrow_regular"
            case .arial_narrow_bold: return "arial-narrow-bold"
            case .arial_narrow_bolditalic: return "arial-narrow-bold-italic"
            case .montserrat_semi_bold_Italic: return "montserrat-semi_bold_Italic"
            case .roboto_regular: return "roboto-regular"
            }
        }

        var asUIFontWeight: UIFont.Weight {
            switch self {
            
            case .arial_narrow_regular: return .regular
            case .arial_narrow_bold: return .bold
            case .arial_narrow_bolditalic: return .bold
            case .montserrat_semi_bold_Italic: return .semibold
            case .roboto_regular: return .regular
                
            }
        }
    }

    /// Static function that creates a banco modal Font
    ///
    /// - Parameters:
    /// - fontSize: Font size
    /// - weight: Font weight
    /// - Returns: Banco modal Font with specified parameters
    public class func bancoModalFont(ofSize fontSize: CGFloat, weight: UIFont.BancoModalWeight) -> UIFont {
        guard let bancoModalFont = UIFont(name: weight.fontName, size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize, weight: weight.asUIFontWeight)
        }

        return bancoModalFont
    }
    
}
