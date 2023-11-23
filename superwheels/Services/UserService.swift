//
//  UserService.swift
//  superwheels
//
//  Created by Syed Shariq on 19/11/2023.
//

import Foundation
import Firebase

final class UserService {
    let db = Firestore.firestore()
    
    // Create operation - Add a new user
    func createUser(newUser: UserModel){
        db.collection("users").document(newUser.id).setData([
            "id": newUser.id,
            "email": newUser.email,
            "firstName": newUser.firstName,
            "lastName": newUser.lastName,
            "password": newUser.password,
            "phoneNumber": newUser.phoneNumber
        ])
        
    }
    
    func updateUser(id: String, updatedUser: UserModel, completion: @escaping (Bool) -> Void) {
        db.collection("users").document(id).setData([
            "email": updatedUser.email,
            "firstName": updatedUser.firstName,
            "lastName": updatedUser.lastName,
            "password": updatedUser.password,
            "phoneNumber": updatedUser.phoneNumber
        ], merge: true) { error in
            if let error = error {
                print("Error updating user:", error)
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func getUser(id: String, completion: @escaping (UserModel?) -> Void) {
        
        db.collection("users").document("test").getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
            } else {
                if let document = document, document.exists {
                    guard let userData = document.data(),
                          let email = userData["email"] as? String,
                          let firstName = userData["firstName"] as? String,
                          let lastName = userData["lastName"] as? String,
                          let password = userData["password"] as? String,
                          let phoneNumber = userData["phoneNumber"] as? String else {
                        completion(nil)
                        return
                    }
                    
                    let user = UserModel(id: document.documentID, email: email, firstName: firstName, lastName: lastName, password: password, phoneNumber: phoneNumber)
                    completion(user)
                    
                    // Perform actions with userData
                    // Example: print(userData)
                    // Example: access specific fields within userData: let username = userData["username"] as? String
                } else {
                    print("Document does not exist")
                }
            }
        }
    }
}
