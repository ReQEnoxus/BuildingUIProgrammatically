//
//  SubtitledLargeTitleTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class SubtitledLargeTitleTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .display(weight: .bold, size: 32)
        label.textColor = .defaultBlack
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .text(weight: .regular, size: 14)
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        
        return label
    }()
    
    lazy var editButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "edit_white"), for: .normal)
        
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ListCellViewModel) {
        
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        switch viewModel.type {
            
        case .inbox:
            
            editButton.setImage(UIImage(named: "edit_black"), for: .normal)
            editButton.tintColor = .defaultBlack
            titleLabel.textColor = .darkListTitleColor
            subtitleLabel.textColor = .darkListSubtitleColor
        case .work:
            
            editButton.setImage(UIImage(named: "edit_white"), for: .normal)
            editButton.tintColor = .white
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        case .shopping:
            
            editButton.setImage(UIImage(named: "edit_white"), for: .normal)
            editButton.tintColor = .white
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        case .family:
            
            editButton.setImage(UIImage(named: "edit_black"), for: .normal)
            editButton.tintColor = .defaultBlack
            titleLabel.textColor = .darkListTitleColor
            subtitleLabel.textColor = .darkListSubtitleColor
        case .personal:
            
            editButton.setImage(UIImage(named: "edit_white"), for: .normal)
            editButton.tintColor = .white
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        }
    }
    
    func setupCell() {
        
        selectionStyle = .none
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewHierarchy() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(editButton)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview().offset(60)
            make.top.equalToSuperview().offset(32)
        }
        
        titleLabel.snp.contentHuggingVerticalPriority = 248
        titleLabel.snp.contentCompressionResistanceVerticalPriority = 753
        
        subtitleLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview().offset(60)
            make.bottom.equalToSuperview().inset(17)
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
        
        editButton.snp.makeConstraints { make in
            
            make.centerY.equalTo(titleLabel)
            make.size.equalTo(24)
            make.trailing.equalToSuperview().inset(14)
        }
    }
}
