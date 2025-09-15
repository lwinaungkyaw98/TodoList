//
//  MainViewViewModel.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignIn: Bool {
        let signIn = Auth.auth().currentUser != nil
        print(String(signIn))
        print(currentUserId)
        return signIn
    }
}
