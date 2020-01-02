//
//  BMGuideline.swift
//  banco modalmais test
//
//  Created by zied on 25/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit

///Every UI in this project supposed to conform to this guideline.
struct BMGuideline {

    /// Typograph constraints.
    enum Typography {
        case caption(weight: UIFont.BancoModalWeight)
        case little(weight: UIFont.BancoModalWeight)
        case tiny(weight: UIFont.BancoModalWeight)

        /// Typography fonts. Use these fonts across your project. You should never instantiate a custom font.
        /// Always use fonts from this Guideline.
        var font: UIFont {
            switch self {
            case .caption(let weight): return .bancoModalFont(ofSize: 14, weight: weight)
            case .little(let weight): return .bancoModalFont(ofSize: 12, weight: weight)
            case .tiny(let weight): return .bancoModalFont(ofSize: 10, weight: weight)
            }
        }

        /// Typography line spacing. Use these line spacing across your project. You should never create a new line spacing.
        /// Always use line spacing from this Guideline.
        var lineSpacing: CGFloat {
            switch self {
            case .caption(_): return 1
            case .little(_): return 1
            case .tiny(_): return 1
            }
        }
    }

}

