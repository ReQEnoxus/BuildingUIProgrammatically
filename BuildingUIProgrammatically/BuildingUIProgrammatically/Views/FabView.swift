//
//  FabView.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class FabView: UIView {
    
    lazy var button: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        button.tintColor = .defaultBlue
        
        return button
    }()
    
    public var handler: ((Bool) -> Void)?
    
    private var activated: Bool = false {
        
        didSet {
            
            guard let handler = handler else { return }
            
            handler(activated)
            
            if activated {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.button.transform = CGAffineTransform(rotationAngle: -.pi / 4)
                    self.backgroundColor = .defaultBlue
                    self.button.tintColor = .white
                }, completion: nil)
            }
            else {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.button.transform = .identity
                    self.backgroundColor = .white
                    self.button.tintColor = .defaultBlue
                }, completion: nil)
            }
        }
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        backgroundColor = .white
        addSubview(button)
        layer.cornerRadius = 32
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func plusButtonPressed() {
        activated.toggle()
    }
}
