//
//  Colors.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static var listGrey: UIColor = .from(hex: "#EBEFF5", alpha: 1)!
    static var listGreen: UIColor = .from(hex: "#61DEA4", alpha: 1)!
    static var listRed: UIColor = .from(hex: "#F45E6D", alpha: 1)!
    static var listYellow: UIColor = .from(hex: "#FFE761", alpha: 1)!
    static var listPurple: UIColor = .from(hex: "#B678FF", alpha: 1)!
    static var defaultBlue: UIColor = .from(hex: "#006CFF", alpha: 1)!
    static var defaultBlack: UIColor = .from(hex: "#252A31", alpha: 1)!
    
    static var darkListTitleColor: UIColor = UIColor.defaultBlack.withAlphaComponent(0.9)
    static var darkListSubtitleColor: UIColor = UIColor.defaultBlack.withAlphaComponent(0.5)
    static var lightListTitleColor: UIColor = UIColor.white.withAlphaComponent(0.9)
    static var lightListSubtitleColor: UIColor = UIColor.white.withAlphaComponent(0.5)
}
