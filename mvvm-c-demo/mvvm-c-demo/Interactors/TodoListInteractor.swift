//
//  TodoListInteractor.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/9/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import Foundation
import RxRelay

protocol TodoListInteractorProtocol {
    var todosObservable: BehaviorRelay <[TodoModel]> { get set}
    func fetchTodos()
}

final class TodoListInteractor: TodoListInteractorProtocol {
    internal var todosObservable: BehaviorRelay <[TodoModel]>
    private var service: NetworkServiceProtocol
    
    init(todos:[TodoModel], service: NetworkServiceProtocol) {
        self.service = service
        self.todosObservable = BehaviorRelay <[TodoModel]>(value: todos)
    }
    
    func fetchTodos() {
        self.service.fetchItem(url: URL(string: "https://jsonplaceholder.typicode.com/todos")!) {(response: Result<[TodoModel], NetworkError>) in
            switch response {
            case .success(let items):
                self.todosObservable.accept(items)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
