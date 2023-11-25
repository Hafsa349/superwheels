//
//  superwheelsApp.swift
//  superwheels
//
//  Created by Hafsa Shariq on 16/11/2023.
//

import SwiftUI
import FirebaseCore
@main
struct superwheelsApp: App {
    init() {
        FirebaseApp.configure()
     }
    var body: some Scene {
        WindowGroup {
            HomeUIView()
        }
    }
}
