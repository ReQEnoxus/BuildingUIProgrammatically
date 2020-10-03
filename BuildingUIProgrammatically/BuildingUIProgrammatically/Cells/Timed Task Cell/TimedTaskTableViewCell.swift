//
//  TimedTaskTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class TimedTaskTableViewCell: UITableViewCell {
    
    lazy var markedImageView: UIImageView = {
        
        let imageView = UIImageView()
        let defaultImage = UIImage(named: "marked")
        imageView.image = defaultImage
        
        return imageView
    }()
    
    lazy var compoundTitleContainer: UIView = {
        
        let view = UIView()
        
        return view
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
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .text(weight: .medium, size: 18)
        label.textColor = .defaultBlack
        label.numberOfLines = .zero
        
        return label
    }()
    
    lazy var firstSubLabelHolder: UIView = {
        
        let view = UIView()
        
        return view
    }()
    
    lazy var secondSubLabelHolder: UIView = {
        
        let view = UIView()
        
        return view
    }()
    
    lazy var firstSubLabelTitleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .text(weight: .medium, size: 14)
        
        return label
    }()
    
    lazy var secondSubLabelTitleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .text(weight: .medium, size: 14)
        
        return label
    }()
    
    lazy var firstSubLabelImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var secondSubLabelImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        return imageView
    }()
    
    var viewModel: TaskViewModel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: TaskViewModel) {
        
        self.viewModel = viewModel
        
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

        
        if let type = viewModel.listType {
            
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
        else {
            listMarkView.backgroundColor = .clear
        }
        
        guard let subLabelConfig = viewModel.subLabelConfiguration else { return }
        firstSubLabelHolder.isHidden = false
        firstSubLabelImageView.image = UIImage(named: subLabelConfig.firstSubLabelImage)
        firstSubLabelTitleLabel.text = subLabelConfig.firstSubLabelText
        
        if viewModel.hasLightAppearance {
            firstSubLabelTitleLabel.textColor = UIColor.white.withAlphaComponent(viewModel.isMarked ? 0.25 : 0.5)
        }
        else {
            firstSubLabelTitleLabel.textColor = UIColor.defaultBlack.withAlphaComponent(viewModel.isMarked ? 0.15 : 0.3)
        }
        firstSubLabelImageView.alpha = viewModel.isMarked ? 0.5 : 1
         
        guard let secondSubLabelText = subLabelConfig.secondSubLabelText,
            let secondSubLabelImage = subLabelConfig.secondSubLabelImage else { return }
        secondSubLabelHolder.isHidden = false
        secondSubLabelImageView.image = UIImage(named: secondSubLabelImage)
        secondSubLabelTitleLabel.text = secondSubLabelText
        
        if viewModel.hasLightAppearance {
            secondSubLabelTitleLabel.textColor = UIColor.white.withAlphaComponent(viewModel.isMarked ? 0.25 : 0.5)
        }
        else {
            secondSubLabelTitleLabel.textColor = UIColor.defaultBlack.withAlphaComponent(viewModel.isMarked ? 0.15 : 0.3)
        }
        
        secondSubLabelImageView.alpha = viewModel.isMarked ? 0.5 : 1
    }
    
    func setupCell() {
        
        selectionStyle = .none
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(markedImageView)
        contentView.addSubview(compoundTitleContainer)
        compoundTitleContainer.addSubview(titleLabel)
        compoundTitleContainer.addSubview(firstSubLabelHolder)
        compoundTitleContainer.addSubview(secondSubLabelHolder)
        firstSubLabelHolder.addSubview(firstSubLabelTitleLabel)
        firstSubLabelHolder.addSubview(firstSubLabelImageView)
        secondSubLabelHolder.addSubview(secondSubLabelTitleLabel)
        secondSubLabelHolder.addSubview(secondSubLabelImageView)
        contentView.addSubview(listMarkView)
        contentView.addSubview(separator)
    }
    
    func setupConstraints() {
        
        markedImageView.snp.makeConstraints { make in
            
            make.size.equalTo(28)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        compoundTitleContainer.snp.makeConstraints { make in
            
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(markedImageView.snp.trailing).offset(16)
            make.trailing.equalTo(listMarkView.snp.leading).inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(18)
            make.trailing.equalToSuperview()
        }
        
        titleLabel.snp.contentHuggingVerticalPriority = 248
        titleLabel.snp.contentCompressionResistanceVerticalPriority = 753
        
        firstSubLabelHolder.snp.makeConstraints { make in
            
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(18)
        }
        
        firstSubLabelImageView.snp.makeConstraints { make in
            
            make.size.equalTo(16)
            make.centerY.leading.equalToSuperview()
        }
        
        firstSubLabelTitleLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(firstSubLabelImageView.snp.trailing).offset(6)
            make.centerY.top.bottom.trailing.equalToSuperview()
        }
        
        secondSubLabelHolder.snp.makeConstraints { make in
            
            make.leading.equalTo(firstSubLabelHolder.snp.trailing).offset(12)
            make.centerY.equalTo(firstSubLabelHolder)
        }
        
        secondSubLabelImageView.snp.makeConstraints { make in
            
            make.size.equalTo(16)
            make.centerY.leading.equalToSuperview()
        }
        
        secondSubLabelTitleLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(secondSubLabelImageView.snp.trailing).offset(6)
            make.centerY.top.bottom.trailing.equalToSuperview()
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

extension TimedTaskTableViewCell: SelectableCell {
    
    func toggleMark() {
        
        viewModel.isMarked.toggle()
        configure(with: viewModel)
    }
}

