//
//  UserViewModel.swift
//  superwheels
//
//  Created by Syed Shariq on 19/11/2023.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: UserModel?
    @Published var isLoading = false // Flag to indicate if data is loading
    private var userService = UserService() // Your user service class
    
    func getUserDetails(for id: String) {
            isLoading = true // Set isLoading to true while fetching data
            userService.getUser(id: id) { userModel in
                DispatchQueue.main.async {
                    self.user = userModel // Update user property with fetched data
                    self.isLoading = false // Set isLoading to false after data is fetched
                }
            }
        }
}

