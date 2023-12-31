//
//  UserService.swift
//  superwheels
//
//  Created by Hafsa Shariq on 19/11/2023.
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
            "phoneNumber": newUser.phoneNumber
        ])
        
    }
    
    func updateUser(id: String, updatedUser: UserModel, completion: @escaping (Bool) -> Void) {
        db.collection("users").document(id).setData([
            "email": updatedUser.email,
            "firstName": updatedUser.firstName,
            "lastName": updatedUser.lastName,
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
        
        db.collection("users").document(id).getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
            } else {
                if let document = document, document.exists {
                    guard let userData = document.data(),
                          let email = userData["email"] as? String,
                          let firstName = userData["firstName"] as? String,
                          let lastName = userData["lastName"] as? String,
                          let phoneNumber = userData["phoneNumber"] as? String else {
                        completion(nil)
                        return
                    }
                    
                    let user = UserModel(id: document.documentID, email: email, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)
                    completion(user)
                   
                } else {
                    print("Document does not exist")
                }
            }
        }
    }
}
