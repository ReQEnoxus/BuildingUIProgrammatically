//
//  ListTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .text(weight: .semibold, size: 18)
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .text(weight: .regular, size: 14)
        
        return label
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
            
            containerView.backgroundColor = .listGrey
            titleLabel.textColor = .darkListTitleColor
            subtitleLabel.textColor = .darkListSubtitleColor
        case .work:
            
            containerView.backgroundColor = .listGreen
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        case .shopping:
            
            containerView.backgroundColor = .listRed
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        case .family:
            
            containerView.backgroundColor = .listYellow
            titleLabel.textColor = .darkListTitleColor
            subtitleLabel.textColor = .darkListSubtitleColor
        case .personal:
            
            containerView.backgroundColor = .listPurple
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
        
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        
        containerView.layer.cornerRadius = 10
    }
    
    func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 58, bottom: 4, right: 16))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(12)
        }
        
        titleLabel.snp.contentHuggingVerticalPriority = 248
        titleLabel.snp.contentCompressionResistanceVerticalPriority = 753
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview().inset(13)
        }
    }
}
