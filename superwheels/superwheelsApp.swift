//
//  superwheelsApp.swift
//  superwheels
//
//  Created by Syed Shariq on 16/11/2023.
//

import SwiftUI
import Firebase
@main
struct superwheelsApp: App {
    init() {
        //FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            HomeUIView()
        }
    }
}
