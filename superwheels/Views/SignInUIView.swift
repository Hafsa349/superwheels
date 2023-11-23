//
//  SignInView.swift
//  superwheels
//
//  Created by Syed Shariq on 17/11/2023.
//
import SwiftUI

struct SignInUIView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isEmailValid = true
    @State private var isPasswordValid = true
    
    var body: some View {
        NavigationView {
            
            GeometryReader { geometry in
                
                VStack {
                    Text("Sign In")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.top, 30)
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .padding(.bottom, 20)
                        .padding(.top, 40)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .onChange(of: email) { newValue in
                            isEmailValid = newValue.isValidEmail()
                        }
                    
                    if !isEmailValid {
                        Text("Please enter a valid email address.")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.leading)
                            .multilineTextAlignment(.leading)
                    }
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .textContentType(.password)
                        .onChange(of: password) { _ in
                            isPasswordValid = password.count >= 6 // Example validation for minimum password length
                        }
                    
                    if !isPasswordValid {
                        Text("Password must contain at least 8 characters.")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.leading)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Button(action: {
                        isEmailValid = email.isValidEmail()
                        isPasswordValid = password.count >= 6 // Example validation for minimum password length
                        
                        if email.isEmpty || !isEmailValid || password.isEmpty || !isPasswordValid {
                            // Handle validation failures
                            print("Validation failed.")
                        } else {
                            // Perform login action using 'email' and 'password'
                            print("Email: \(email)")
                            print("Password: \(password)")
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                    .padding(.top, 20)
                    NavigationLink(destination: SignUpUIView().navigationBarBackButtonHidden(true)) {
                        Text("Create an account")
                            .foregroundColor(.orange)
                            .padding()
                    }
                    Spacer()
                }
                .navigationBarHidden(true)
            }
        }
    }
}

extension String {
    func isValidEmail() -> Bool {
        // Simple email validation regex pattern
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}

#Preview {
    SignInUIView()
}
