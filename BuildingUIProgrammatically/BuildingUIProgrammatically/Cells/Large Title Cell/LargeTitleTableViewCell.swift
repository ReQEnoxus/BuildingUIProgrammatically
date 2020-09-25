//
//  LargeTitleTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class LargeTitleTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .display(weight: .bold, size: 32)
        label.text = "Today"
        label.textColor = .defaultBlack
        
        return label
    }()
    
    lazy var ellipsisButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "more"), for: .normal)
        
        return button
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
        contentView.addSubview(ellipsisButton)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(60)
            make.bottom.equalToSuperview().inset(17)
            make.top.equalToSuperview().offset(16)
        }
        
        ellipsisButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(13.5)
        }
    }
}
