//
//  TodoListViewViewModel.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//

import Foundation
import FirebaseFirestore

class TodoListViewViewModel: ObservableObject {
    
    @Published var showNewItemView: Bool = false
    private let userID: String
    
    init(userId: String) {
        self.userID = userId
    }
    
    func delete(id : String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
}
