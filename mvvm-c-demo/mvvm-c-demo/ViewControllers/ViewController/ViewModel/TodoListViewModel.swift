//
//  ViewModel.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/9/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import Foundation
import RxSwift

class TodoListViewModel {
    private let interactor: TodoListInteractorProtocol
    private let coordinator: TodoListCoordinatorProtocol
    
    private var todoList: [TodoModel] {
        return interactor.todosObservable.value
    }
    
    init(interactor: TodoListInteractorProtocol, coordinator: TodoListCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func fetchTodo() {
        // interaction to be handled within calçot
        self.interactor.fetchTodos()
    }
    
    func showTodoItem(index: Int) {
        coordinator.showListItem(item: todoList[index])
    }
    
    func numberOfRows() -> Int {
        return todoList.count
    }
    
    func data(forRowAt index: Int) -> TodoViewCellModel {
        let todo = todoList[index]
        return TodoViewCellModel(id: todo.id, title: todo.title, completed: todo.completed)
    }
    
    func screenTitle() -> String {
        return "Todo List"
    }
    
}
