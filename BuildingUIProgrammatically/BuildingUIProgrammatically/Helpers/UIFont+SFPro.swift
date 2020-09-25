//
//  UIFont+SFPro.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static func text(weight: UIFont.Weight, size: CGFloat) -> UIFont {
        return UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Text", .traits: [UIFontDescriptor.TraitKey.weight: weight]]), size: size)
    }
    
    static func display(weight: UIFont.Weight, size: CGFloat) -> UIFont {
        return UIFont(descriptor: UIFontDescriptor(fontAttributes: [.name: "SF Pro Display", .traits: [UIFontDescriptor.TraitKey.weight: weight]]), size: size)
    }
}
