//
//  CustomPicker.swift
//  superwheels
//
//  Created by Hafsa Shariq on 25/11/2023.
//

import SwiftUI
struct CustomPicker: View {
    @Binding var selectedValue: String
    var values: [String]
    var title: String
    
    var body: some View {
        
        Picker(title, selection: $selectedValue) {
            Text("").tag(Optional<String>(nil))
            ForEach(values, id: \.self) { value in
                Text(value).foregroundStyle(.black)
            }
        }
        .pickerStyle(.navigationLink) // Apply a wheel picker style
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
        .foregroundColor(.primaryOrange)
        
        
    }
}
