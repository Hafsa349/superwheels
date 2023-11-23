//
//  MyAccountView.swift
//  superwheels
//
//  Created by Syed Shariq on 17/11/2023.
//

import SwiftUI

struct MyAccountUIView: View {
    @StateObject private var viewModel = UserViewModel()

        var body: some View {
            VStack {
                if viewModel.isLoading {
                    Text("Loading ...")
                } else {
                    if let currentUser = viewModel.user {
                        Text("Email: \(currentUser.email)")
                        Text("First Name: \(currentUser.firstName)")
                        Text("Last Name: \(currentUser.lastName)")
                        Text("Phone Number: \(currentUser.phoneNumber)")
                    } else {
                        Text("Failed to retrieve user details.")
                    }
                }
            }
            .onAppear {
                viewModel.getUserDetails(for: "3PHOJwmELxCULSQf2c0F")
            }
            .navigationBarTitle("My Account")
        }
}
