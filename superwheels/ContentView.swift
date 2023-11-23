//
//  ContentView.swift
//  superwheels
//
//  Created by Hafsa Shariq on 16/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var active: Bool = false
        var body: some View {
            NavigationView {
                List {
                    NavigationLink(destination: HomeUIView()) {
                        Text("Search")
                    }
                    NavigationLink("General", destination: EmptyView())
                    NavigationLink("About", destination: EmptyView())
                }
            }
        }
}

#Preview {
    ContentView()
}
