//
//  UITableViewCell+ClassName.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var className: String {
        
        return String(describing: self)
    }
}
