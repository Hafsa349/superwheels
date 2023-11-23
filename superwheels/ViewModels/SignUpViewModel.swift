//
//  SignUpViewModel.swift
//  superwheels
//
//  Created by Syed Shariq on 20/11/2023.
//

import Foundation

class SignUpViewModel: ObservableObject {
    //@Published var cardBalance: String = "$0.00"

    var userService = UserService()
    
    func createUser(userModel: UserModel){
        userService.createUser(newUser: userModel)
    }
    
}
