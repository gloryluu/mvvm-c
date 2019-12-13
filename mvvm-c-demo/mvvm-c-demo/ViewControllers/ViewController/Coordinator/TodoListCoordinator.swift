//
//  TodoListCoordinator.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/9/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import UIKit

protocol TodoListCoordinatorProtocol {
    func showListItem(item: TodoModel)
}

class TodoListCoordinator: TodoListCoordinatorProtocol {
    weak var navigationController: UINavigationController?
    
    func showListItem(item: TodoModel) {
        let coordinator = TodoListItemCoordinator(navigationController: self.navigationController)
        let interactor = TodoListItemInteractor(todo: item)
        let viewModel = TodoListItemViewModel(interactor: interactor, coordinator: coordinator)
        let viewController = TodoListItemViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//let todoListCoordinator = TodoListCoordinator()
//let todoListInteractor = TodoListInteractor(todos: list, service: NetworkService())
//let todoListViewModel = TodoListViewModel(interactor: todoListInteractor, coordinator: todoListCoordinator)
//let todoListViewController = ViewController(viewModel: todoListViewModel)
//
//// Adding observer listening to model change
//_ = todoListInteractor.todosObservable.asObservable().observeOn(MainScheduler.instance).subscribe { _ in
//    todoListViewController.viewModel = TodoListViewModel(interactor: todoListInteractor, coordinator: todoListCoordinator)
//}
//
////
//let navigationController = UINavigationController(rootViewController: todoListViewController)
//todoListCoordinator.navigationController = navigationController
//
//return navigationController
