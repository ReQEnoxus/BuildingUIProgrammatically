//
//  ListsHeaderTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class ListsHeaderTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Lists"
        label.font = .text(weight: .bold, size: 16)
        label.textColor = UIColor.defaultBlack.withAlphaComponent(0.3)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        selectionStyle = .none
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview().offset(60)
            make.top.equalToSuperview().offset(32)
            make.bottom.equalToSuperview().inset(11)
        }
    }
}
