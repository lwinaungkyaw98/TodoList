//
//  LoginView.swift
//  TodoList
//
//  Created by Lwin Aung Kyaw on 9/14/25.
//


import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //header
                HeaderView(title: "To Do List", subTitle: "Get Things Done", angle: 15, background: Color.pink)
                
                //login form
                Form{
                    if !viewModel.errMassage.isEmpty {
                        Text(viewModel.errMassage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue){
                        viewModel.login()
                    }
                        .padding()
                }
                
                //create account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    
    }
}

#Preview {
    LoginView()
}
