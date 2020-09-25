//
//  TaskTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    lazy var markedImageView: UIImageView = {
        
        let imageView = UIImageView()
        let defaultImage = UIImage(named: "marked")
        imageView.image = defaultImage
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .text(weight: .medium, size: 18)
        label.textColor = .defaultBlack
        label.numberOfLines = .zero
        
        return label
    }()
    
    lazy var listMarkView: UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    lazy var separator: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.defaultBlack.withAlphaComponent(0.1)
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: TaskViewModel) {
        
        let unmarkedImageName = viewModel.hasLightAppearance ? "unmarked_light" : "unmarked"
        markedImageView.image = UIImage(named: viewModel.isMarked ? "marked" : unmarkedImageName)
        titleLabel.text = viewModel.title
        
        if viewModel.hasLightAppearance {
            
            separator.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            titleLabel.textColor = UIColor.white.withAlphaComponent(viewModel.isMarked ? 0.5 : 1)
        }
        else {
            titleLabel.textColor = UIColor.defaultBlack.withAlphaComponent(viewModel.isMarked ? 0.5 : 1)
        }
        
        guard let type = viewModel.listType else {
            
            listMarkView.backgroundColor = .clear
            return
        }
        
        switch type {
            
        case .inbox:
            listMarkView.backgroundColor = .listGrey
        case .work:
            listMarkView.backgroundColor = .listGreen
        case .shopping:
            listMarkView.backgroundColor = .listRed
        case .family:
            listMarkView.backgroundColor = .listYellow
        case .personal:
            listMarkView.backgroundColor = .listPurple
        }
    }
    
    func setupCell() {
        
        selectionStyle = .none
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewHierarchy() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(markedImageView)
        contentView.addSubview(listMarkView)
        contentView.addSubview(separator)
    }
    
    func setupConstraints() {
        
        markedImageView.snp.makeConstraints { make in
            
            make.size.equalTo(28)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            
            make.top.bottom.equalToSuperview().inset(18)
            make.leading.equalTo(markedImageView.snp.trailing).offset(16)
            make.trailing.equalTo(listMarkView.snp.leading).inset(16)
        }
        
        listMarkView.snp.makeConstraints { make in
            
            make.size.equalTo(12)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
        
        separator.snp.makeConstraints { make in
            
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(60)
            make.bottom.trailing.equalToSuperview()
        }
    }
}
