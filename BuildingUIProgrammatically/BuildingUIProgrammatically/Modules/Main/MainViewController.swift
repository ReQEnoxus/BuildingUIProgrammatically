//
//  MainViewController.swift
//  BuildingUIProgrammatically
//
//  Created by Enoxus on 25.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var tasks: [TaskViewModel] = [
        TaskViewModel(title: "Start making a presentation", listType: .work, isMarked: false, subLabelConfiguration: nil),
        TaskViewModel(title: "Pay for rent", listType: .personal, isMarked: true, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "clock", firstSubLabelText: "7:00 pm", secondSubLabelImage: nil, secondSubLabelText: nil)),
        TaskViewModel(title: "Buy a milk", listType: .shopping, isMarked: true, subLabelConfiguration: nil),
        TaskViewModel(title: "Don’t forget to pick up Mickael from school", listType: nil, isMarked: false, subLabelConfiguration: nil),
        TaskViewModel(title: "Buy a chocolate for Charlotte", listType: .shopping, isMarked: false, subLabelConfiguration: nil)
    ]
    
    var lists: [ListCellViewModel] = [
        ListCellViewModel(subtitle: "1 task", type: .inbox),
        ListCellViewModel(subtitle: "2 tasks", type: .work),
        ListCellViewModel(subtitle: "3 tasks", type: .shopping),
        ListCellViewModel(subtitle: "1 task", type: .family),
        ListCellViewModel(subtitle: "4 tasks", type: .personal)
    ]
    
    let fabView = FabView()
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    lazy var popupView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var popupSeparatorView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.defaultBlack.withAlphaComponent(0.1)
        
        return view
    }()
    
    lazy var newListImageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "newList"))
        
        return imageView
    }()
    
    lazy var newTaskImageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "newTask"))
        
        return imageView
    }()
    
    lazy var newTaskLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Task"
        label.textColor = .defaultBlue
        label.font = .text(weight: .semibold, size: 18)
        
        return label
    }()
    
    lazy var newListLabel: UILabel = {
        
        let label = UILabel()
        label.text = "List"
        label.textColor = .defaultBlue
        label.font = .text(weight: .semibold, size: 18)
        
        return label
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        registerCells()
        setupViewHierarchy()
        setupConstraints()
        
        popupView.alpha = 0
        
        setupFabAction()
        
        view.backgroundColor = .white
        
        tableView.reloadData()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        setupPopupShadow()
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
    
    private func setupPopupShadow() {
        
        let shadowPath = UIBezierPath(roundedRect: popupView.bounds, cornerRadius: 0)
        popupView.layer.shadowPath = shadowPath.cgPath
        popupView.layer.shadowColor = UIColor(red: 0.075, green: 0.11, blue: 0.161, alpha: 0.2).cgColor
        popupView.layer.shadowOpacity = 1
        popupView.layer.shadowRadius = 30
        popupView.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
    private func setupFabAction() {
        
        fabView.handler = { [weak self] active in
            
            guard let self = self else { return }
            
            if active {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.popupView.alpha = 1
                    self.tableView.alpha = 0.3
                }, completion: { _ in
                    self.tableView.isUserInteractionEnabled = false
                })
            }
            else {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.popupView.alpha = 0
                    self.tableView.alpha = 1
                }, completion: { _ in
                    self.tableView.isUserInteractionEnabled = true
                })
            }
        }
    }
    
    private func registerCells() {
        
        tableView.register(cell: LargeTitleTableViewCell.self)
        tableView.register(cell: TaskTableViewCell.self)
        tableView.register(cell: TimedTaskTableViewCell.self)
        tableView.register(cell: ListsHeaderTableViewCell.self)
        tableView.register(cell: ListTableViewCell.self)
    }
    
    private func setupViewHierarchy() {
        
        view.addSubview(tableView)
        view.addSubview(fabView)
        view.addSubview(popupView)
        popupView.addSubview(newTaskLabel)
        popupView.addSubview(newListLabel)
        popupView.addSubview(newListImageView)
        popupView.addSubview(newTaskImageView)
        popupView.addSubview(popupSeparatorView)
        
        popupView.layer.cornerRadius = 10
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        popupView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 220, height: 121))
            make.trailing.equalToSuperview().inset(16)
        }
        
        fabView.snp.makeConstraints { make in
            make.size.equalTo(64)
            make.bottom.equalToSuperview().inset(44)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(popupView.snp.bottom).offset(18)
        }
        
        newTaskImageView.snp.makeConstraints { make in
            
            make.size.equalTo(24)
            make.leading.top.equalToSuperview().offset(18)
        }
        
        newTaskLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(newTaskImageView.snp.trailing).offset(12)
            make.centerY.equalTo(newTaskImageView)
        }
        
        popupSeparatorView.snp.makeConstraints { make in
            
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        newListImageView.snp.makeConstraints { make in
            
            make.size.equalTo(24)
            make.leading.bottom.equalToSuperview().inset(18)
        }
        
        newListLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(newListImageView.snp.trailing).offset(12)
            make.centerY.equalTo(newListImageView)
        }
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        let index = indexPath.row
        
        if index > tasks.count + 1 {
            
            let list = lists[index - tasks.count - 2]
            var tasks: [TaskViewModel] = []
            
            switch list.type {
                
            case .inbox:
                
                tasks.append(TaskViewModel(title: "Don’t forget to pick up Mickael from school", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar", firstSubLabelText: "Today", secondSubLabelImage: nil, secondSubLabelText: nil)))
            case .work:
                
                tasks.append(TaskViewModel(title: "Start making a presentation", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Today", secondSubLabelImage: nil, secondSubLabelText: nil), hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Call John", listType: list.type, isMarked: false, subLabelConfiguration: nil, hasLightAppearance: true))
            case .shopping:
                
                tasks.append(TaskViewModel(title: "Buy a milk", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Today", secondSubLabelImage: nil, secondSubLabelText: nil), hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Buy a chocolate for Charlotte", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Today", secondSubLabelImage: nil, secondSubLabelText: nil), hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Grapes", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Tomorrow", secondSubLabelImage: nil, secondSubLabelText: nil), hasLightAppearance: true))
            case .family:
                
                tasks.append(TaskViewModel(title: "Greet niece", listType: list.type, isMarked: false, subLabelConfiguration: nil))
            case .personal:
                
                tasks.append(TaskViewModel(title: "Pay for rent", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Today", secondSubLabelImage: "clock_light", secondSubLabelText: "7:00 pm"), hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Cut one’s hair", listType: list.type, isMarked: false, subLabelConfiguration: nil, hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Continue learning French", listType: list.type, isMarked: false, subLabelConfiguration: nil, hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Charge AirPods", listType: list.type, isMarked: false, subLabelConfiguration: nil, hasLightAppearance: true))
            }
            
            let viewModel = ListViewModel(header: list, tasks: tasks)
            
            let vc = ListViewController()
            
            vc.configure(with: viewModel)
            
            present(vc, animated: true)
        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count + lists.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch index {
            
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: LargeTitleTableViewCell.className, for: indexPath)
        case 1 ..< tasks.count + 1:
            
            let viewModel = tasks[index - 1]
            if viewModel.isTimed {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TimedTaskTableViewCell.className, for: indexPath) as! TimedTaskTableViewCell
                cell.configure(with: viewModel)
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.className, for: indexPath) as! TaskTableViewCell
                cell.configure(with: viewModel)
                return cell
            }
        case tasks.count + 1:
            
            return tableView.dequeueReusableCell(withIdentifier: ListsHeaderTableViewCell.className, for: indexPath)
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.className, for: indexPath) as! ListTableViewCell
            cell.configure(with: lists[index - tasks.count - 2])
            return cell
        }
    }
}
