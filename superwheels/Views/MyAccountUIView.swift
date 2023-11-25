//
//  MyAccountView.swift
//  superwheels
//
//  Created by Hafsa Shariq on 17/11/2023.
//

import SwiftUI

struct MyAccountUIView: View {
    //@StateObject private var viewModel = UserViewModel()
    @State private var email = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var password = ""
    @State private var phoneNumberCode = "+61"
    @State private var isEmailValid = true
    @State private var isPasswordValid = true
    @State private var confirmPassword = ""
    let topBarHeight: CGFloat = 100
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                GeometryReader { geometry in
                    VStack(alignment: .leading) {
                        Text("My account")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.bottom, 10).padding(.leading, 16).padding(4)
                        
                        Text("First Name").padding(.leading, 16).padding(4)
                        
                        TextField("First Name", text: $firstName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                            .onChange(of: firstName) { newValue in
                                 isEmailValid = newValue.isValidEmail()
                            }
                        
                        Text("Last Name").padding(.leading, 16).padding(4)
                        
                        TextField("Last Name", text: $lastName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .autocapitalization(.none)
                            .onChange(of: lastName) { newValue in
                                 isEmailValid = newValue.isValidEmail()
                            }
                        
                        Text("Email").padding(.leading, 16).padding(4)
                        
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
                        Text("Mobile Number").padding(.leading, 16).padding(4)
                        
                        
                        HStack{
                            Text("+61")
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .padding(.horizontal)
                                .autocapitalization(.none)
                            
                            TextField("Mobile Number", text: $email)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .padding(.horizontal)
                                .autocapitalization(.none)
                                .textContentType(.telephoneNumber)
                        }
                        
                        if !isEmailValid {
                            Text("Please enter a valid Mobile number.")
                                .foregroundColor(.red)
                                .font(.footnote)
                                .padding(.leading)
                                .multilineTextAlignment(.leading)
                        }
                        Spacer()
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
                            Text("Save")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(8)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                        }
                        
                    }
                    .navigationBarHidden(true)
                }
            }
        }
    }
}
