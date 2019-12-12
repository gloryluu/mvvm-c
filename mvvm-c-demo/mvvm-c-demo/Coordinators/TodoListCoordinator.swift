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
        
    }
}
