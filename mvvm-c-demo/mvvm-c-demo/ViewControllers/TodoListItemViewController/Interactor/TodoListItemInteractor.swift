//
//  TodoListItemInteractor.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/13/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import Foundation
import RxRelay

protocol TodoListItemInteractorProtocol {
    var todo: TodoModel { get }
}

class TodoListItemInteractor:TodoListItemInteractorProtocol {
    var todo: TodoModel
    
    init(todo: TodoModel) {
        self.todo = todo
    }
}

