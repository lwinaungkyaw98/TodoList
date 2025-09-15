//
//  TodoItemViewViewModel.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoItemViewViewModel : ObservableObject {
    
    init() { }
    
    func toggleIsDone(item: TodoItem) {
        var itemCopy = item
        itemCopy.toggleDone(!item.isDone)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}

