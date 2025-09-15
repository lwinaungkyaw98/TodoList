//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject{
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errMassage: String = ""
    
    init() {
        
    }
    
    func login(){
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errMassage = "Please fill all fields"
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            errMassage = "Invalid Email Format!"
            return false
        }
        
        return true

    }
    
}
