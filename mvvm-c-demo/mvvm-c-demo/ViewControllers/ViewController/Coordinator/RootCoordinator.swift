//
//  RootCoordinator.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/10/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

/*
 This class is for navigate from AppDelegate
 */
import UIKit
import RxSwift

final class RootCoordinator:NSObject {
    static func presentTodoLists(list:[TodoModel] = []) -> UINavigationController {
        
        // Preparing the new calçot
        let todoListCoordinator = TodoListCoordinator()
        let todoListInteractor = TodoListInteractor(todos: list, service: NetworkService())
        let todoListViewModel = TodoListViewModel(interactor: todoListInteractor, coordinator: todoListCoordinator)
        let todoListViewController = ViewController(viewModel: todoListViewModel)
        
        // Adding observer listening to model change
        _ = todoListInteractor.todosObservable.asObservable().observeOn(MainScheduler.instance).subscribe { _ in
            todoListViewController.viewModel = TodoListViewModel(interactor: todoListInteractor, coordinator: todoListCoordinator)
        }
        
        //
        let navigationController = UINavigationController(rootViewController: todoListViewController)
        todoListCoordinator.navigationController = navigationController
        
        return navigationController
    }
}
