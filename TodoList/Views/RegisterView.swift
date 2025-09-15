//
//  RegisterView.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subTitle: "Start organization todo", angle: -15, background: .green)
            
            //register form
            Form{
                if !viewModel.errMassage.isEmpty{
                    Text(viewModel.errMassage)
                        .foregroundColor(.red)
                }
                TextField("FullName", text: $viewModel.fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green){
                    viewModel.register()
                }
                .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
