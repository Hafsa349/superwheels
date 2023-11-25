//
//  UserViewModel.swift
//  superwheels
//
//  Created by Hafsa Shariq on 19/11/2023.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: UserModel?
    private var userService = UserService() // Your user service class
    
    func getUserDetails(for id: String) {
        userService.getUser(id: id) { userModel in
            DispatchQueue.main.async {
                self.user = userModel // Update user property with fetched data                }
            }
        }
    }
    
    func getCustomerName() -> String? {
        if let firstName = user?.firstName, let lastName = user?.lastName {
            return "\(firstName) \(lastName)"
        } else {
            return nil // or return a default value like "Unknown" if you prefer
        }
    }
}
