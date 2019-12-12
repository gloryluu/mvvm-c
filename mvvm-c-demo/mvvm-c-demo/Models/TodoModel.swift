
//
//  Todo.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/9/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import Foundation

struct TodoModel: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
