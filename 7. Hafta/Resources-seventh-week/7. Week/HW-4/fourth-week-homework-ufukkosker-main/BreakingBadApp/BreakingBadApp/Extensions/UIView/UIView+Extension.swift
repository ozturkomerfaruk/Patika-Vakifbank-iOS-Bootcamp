//
//  UIView+Extension.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import UIKit

extension UIView {
    func setConstarint(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        topConstraint: CGFloat? = nil,
        leadingConstraint: CGFloat? = nil,
        bottomConstraint: CGFloat? = nil,
        trailingConstraint: CGFloat? = nil,
        centerX: NSLayoutXAxisAnchor? = nil,
        centerY: NSLayoutYAxisAnchor? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top, let topConstraint = topConstraint {
            self.topAnchor.constraint(equalTo: top, constant: topConstraint).isActive = true
        }
        
        if let leading = leading, let leadingConstraint = leadingConstraint {
            self.leadingAnchor.constraint(equalTo: leading, constant: leadingConstraint).isActive = true
        }
        
        if let bottom = bottom, let bottomConstraint = bottomConstraint {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstraint).isActive = true
        }
        
        if let trailing = trailing, let trailingConstraint = trailingConstraint {
            self.trailingAnchor.constraint(equalTo: trailing, constant: -trailingConstraint).isActive = true
        }
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
