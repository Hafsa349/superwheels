//
//  SessionManager.swift
//  superwheels
//
//  Created by Hafsa Shariq on 26/11/2023.
//

import Foundation
import SwiftUI

class SessionManager: ObservableObject {
    @AppStorage("userSessionID") var userSessionID: String = ""
    
    func saveSessionID(_ sessionID: String) {
        userSessionID = sessionID
    }
    
    func clearSession() {
        userSessionID = ""
    }
    
    func getSessionId() -> String {
       return userSessionID
    }
}
