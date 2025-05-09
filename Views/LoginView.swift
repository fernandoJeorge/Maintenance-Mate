//
//  LoginView.swift
//  Maintenance Mate
//
//  Created by Fernando Cardona on 3/15/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Maintenance Mate", subtitle: "Never let a car break down without you ", angle: 15, background: .pink)
                
                
                //login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log In",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                //Create account 
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View{
        LoginView()
    }
}
