//
//  User.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email : String
    let joined: TimeInterval
}
