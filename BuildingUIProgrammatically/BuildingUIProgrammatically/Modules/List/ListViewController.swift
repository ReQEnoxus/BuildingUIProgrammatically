//
//  ListViewController.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    
    var viewModel: ListViewModel!
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        return tableView
    }()
    
    let fabView = FabView()
    
    func configure(with viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupViewHierarchy()
        setupConstraints()
        setupTableView()
    }
    
    private func setupViewHierarchy() {
        
        view.addSubview(tableView)
        view.addSubview(fabView)
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        setupFabShadow()
    }
    
    private func setupFabShadow() {
        
        let shadowPath = UIBezierPath(roundedRect: fabView.bounds, cornerRadius: 0)
        fabView.layer.shadowPath = shadowPath.cgPath
        fabView.layer.shadowColor = UIColor(red: 0.084, green: 0.139, blue: 0.218, alpha: 0.16).cgColor
        fabView.layer.shadowOpacity = 1
        fabView.layer.shadowRadius = 32
        fabView.layer.shadowOffset = CGSize(width: 0, height: 24)
    }
    
    private func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        fabView.snp.makeConstraints { make in
            make.size.equalTo(64)
            make.bottom.equalToSuperview().inset(44)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupTableView() {
        
        switch viewModel.header.type {
            
        case .inbox:
            tableView.backgroundColor = .listGrey
        case .work:
            tableView.backgroundColor = .listGreen
        case .shopping:
            tableView.backgroundColor = .listRed
        case .family:
            tableView.backgroundColor = .listYellow
        case .personal:
            tableView.backgroundColor = .listPurple
        }
        
        registerCells()
    }
    
    private func registerCells() {
        
        tableView.register(cell: SubtitledLargeTitleTableViewCell.self)
        tableView.register(cell: TaskTableViewCell.self)
        tableView.register(cell: TimedTaskTableViewCell.self)
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch index {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SubtitledLargeTitleTableViewCell.className, for: indexPath) as! SubtitledLargeTitleTableViewCell
            cell.configure(with: viewModel.header)
            cell.backgroundColor = .clear
            return cell
        default:
            
            let task = viewModel.tasks[index - 1]
            if task.isTimed {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TimedTaskTableViewCell.className, for: indexPath) as! TimedTaskTableViewCell
                cell.configure(with: task)
                cell.backgroundColor = .clear
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.className, for: indexPath) as! TaskTableViewCell
                cell.configure(with: task)
                cell.backgroundColor = .clear
                return cell
            }
        }
    }
}
