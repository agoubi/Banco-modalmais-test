//
//  UIImageExtensions.swift
//  banco modalmais test
//
//  Created by zied on 25/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit

fileprivate class BancoModalImage { }

extension UIImage {

    public class var icBack: UIImage {
        return UIImage(named: "back_icon", in: Bundle(for: BancoModalImage.self), compatibleWith: nil)!
    }
    
    public class var icCircleGray: UIImage {
        return UIImage(named: "circle_gray_icon", in: Bundle(for: BancoModalImage.self), compatibleWith: nil)!
    }
    
    public class var icExit: UIImage {
        return UIImage(named: "exit_icon", in: Bundle(for: BancoModalImage.self), compatibleWith: nil)!
    }
    
    public class var icFilter: UIImage {
        return UIImage(named: "filter_icon", in: Bundle(for: BancoModalImage.self), compatibleWith: nil)!
    }
    
    public class var icSearch: UIImage {
        return UIImage(named: "search_icon", in: Bundle(for: BancoModalImage.self), compatibleWith: nil)!
    }
    
    public class var icExitBlack: UIImage {
        return UIImage(named: "exit_black", in: Bundle(for: BancoModalImage.self), compatibleWith: nil)!
    }
    
    public class var icGreenExit: UIImage {
        return UIImage(named: "green_exit", in: Bundle(for: BancoModalImage.self), compatibleWith: nil)!
    }
    
    public class var icDefaultImage: UIImage {
        return UIImage(named: "landscape_image", in: Bundle(for: BancoModalImage.self), compatibleWith: nil)!
    }
    
    public class var icCheckboxWhite: UIImage {
        return UIImage(named: "checkbox_white", in: Bundle(for: BancoModalImage.self), compatibleWith: nil)!
    }
}
