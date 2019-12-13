//
//  TodoListItemViewModel.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/13/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import Foundation

class TodoListItemViewModel {
    private let interactor: TodoListItemInteractorProtocol
    private let coordinator: TodoListItemCoordinatorProtocol
    
    init(interactor: TodoListItemInteractorProtocol, coordinator: TodoListItemCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func showTodoItem() -> TodoModel{
        self.interactor.todo
    }
}
