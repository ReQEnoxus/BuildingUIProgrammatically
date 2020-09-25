//
//  UITableView+Register.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(cell: UITableViewCell.Type) {
        
        register(cell, forCellReuseIdentifier: cell.className)
    }
}
