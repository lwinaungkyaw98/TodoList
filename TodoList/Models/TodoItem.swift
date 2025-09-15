//
//  TodoItem.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    let id: String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone: Bool
    
    mutating func toggleDone (_ state: Bool) {
        self.isDone = state
    }
}
