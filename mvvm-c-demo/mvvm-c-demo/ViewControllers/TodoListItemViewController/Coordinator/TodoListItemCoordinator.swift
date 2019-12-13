//
//  TodoListItemCoordinator.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/13/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import UIKit

protocol TodoListItemCoordinatorProtocol {
    
}

class TodoListItemCoordinator: TodoListItemCoordinatorProtocol {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}
