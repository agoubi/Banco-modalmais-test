//
//  UILabelExtensions.swift
//  banco modalmais test
//
//  Created by zied on 25/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation

import UIKit

extension UILabel {

    /// Helper function to set text to an UILabel and return itself.
    ///
    /// - Parameter text: The current text that is displayed by the label.
    /// - Returns: Returns the label with its text set
    @discardableResult public func setText(_ text: String?) -> UILabel {
        self.text = text
        return self
    }

    /// Add line spacing in the UILabel.
    ///
    /// - Parameter lineSpacing: The distance in points between the bottom of one line fragment and the top of the next.
    /// - Returns: Return the label with its line spacing set.
    @discardableResult public func addLineSpacing(_ lineSpacing: CGFloat) -> UILabel {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        let attributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: attributes)
        return self
    }

    /// Add text alignment in the UILabel.
    ///
    /// - Parameter alignment: The text alignment of the receiver.
    /// - Returns: Return the label with its alignment set.
    @discardableResult public func addAlignment(_ alignment: NSTextAlignment) -> UILabel {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        let attributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: attributes)
        return self
    }

    /// Applies typography to the Label.
    ///
    /// - Parameters:
    ///   - typography: The Typography type.
    ///   - color: The color of the text.
    public func apply(typography: BMGuideline.Typography, with color: UIColor) {
        font = typography.font
        textColor = color
        addLineSpacing(typography.lineSpacing)
    }
}
