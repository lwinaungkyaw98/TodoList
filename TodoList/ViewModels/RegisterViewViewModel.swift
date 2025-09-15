//
//  RegisterViewViewModel.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject {
    
    @Published var fullName : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var errMassage : String = ""
    
    init (){
        
    }
    
    func register() {
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            guard let userId = result?.user.uid else {
                print("error")
                return
            }
            
            self.insertUserRecord(id: userId)
            
        }
    }
    
    private func insertUserRecord(id: String) {
        print("insert")
        let user = User(id: id, name: fullName, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(user.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errMassage = "All fields are required!"
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            errMassage = "Invalid Email Format!"
            return false
        }

        
        return true
    }
}
