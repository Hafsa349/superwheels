//
//  CustomTextField.swift
//  superwheels
//
//  Created by Hafsa Shariq on 25/11/2023.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var onChange: (() -> Void)?

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
            .autocapitalization(.none)
            .onChange(of: text, perform: { _ in
                onChange?()
            })
    }
}
