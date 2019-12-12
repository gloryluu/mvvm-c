//
//  ViewController.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/9/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import UIKit
import Combine

protocol ViewControllerProtocol {
    func viewInit()
    func constraintsInit()
}

class BaseViewController: UIViewController, ViewControllerProtocol {
    func viewInit() {
        view.backgroundColor = UIColor.white
    }
    
    func constraintsInit() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInit()
        constraintsInit()
    }
}

class ViewController: BaseViewController {
    private let tableView: UITableView = UITableView(frame: .zero)
    
    var viewModel: TodoListViewModel {
        didSet {
            updateUI()
        }
    }
    
    init(viewModel: TodoListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        super.init(coder: aDecoder) // With Storyboard
        fatalError("Never will happen") // No storyboard
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchTodo()
    }
    
    override func viewInit() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoViewCell.self, forCellReuseIdentifier: TodoViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
    }
    
    override func constraintsInit() {
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func updateUI() {
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // viewmodel.show todo detail
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoViewCell.cellIdentifier, for: indexPath) as? TodoViewCell else {
            fatalError("Could not dequeue cell with identifier: \(TodoViewCell.cellIdentifier)")
        }
        
        let todoCellViewModel = viewModel.data(forRowAt: indexPath.row)
        cell.configure(viewModel: todoCellViewModel)
        
        return cell
    }
    
    
}
