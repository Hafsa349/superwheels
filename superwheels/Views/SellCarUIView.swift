//
//  SellCarView.swift
//  superwheels
//
//  Created by Hafsa Shariq on 17/11/2023.
//

import SwiftUI

struct SellCarUIView: View {
    
    @StateObject private var viewModel = CarsViewModel()
    @State private var odometer = ""
    @State private var suburb = ""
    @State private var postcode = ""
    let topBarHeight: CGFloat = 160 // Increased height for the top bar
    @State private var selectedMake = ""
    @State private var selectedModel = ""
    @State private var selectedTransmission = ""
    @State private var selectedColor = ""
    @State private var selectedState = ""
    @State var selectedYear = "" // Initial value for selected year
    
    var body: some View {
        NavigationView {
            
            GeometryReader { geometry in
                Color.primaryOrange
                    .frame(height: topBarHeight)
                    .edgesIgnoringSafeArea(.top)
                    .zIndex(0) // Ensure it stays on top
                
                VStack() {
                    Image("LogoHorizontal")
                        .resizable()
                        .frame(width: 242.0, height: 84.0)
                    VStack(alignment: .leading) {
                        ScrollView(.vertical){
                            Text("Sell your car").font(.largeTitle)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.top, 40)
                                .padding(.leading, 16)
                            
                            
                            CustomPicker(selectedValue: $selectedMake, values: viewModel.brandNames, title: "Make")
                                .onAppear {
                                    // Fetch brands when the view appears
                                    viewModel.getBrands()
                                }
                            
                            CustomPicker(selectedValue: $selectedModel, values: viewModel.getCarModels(for: selectedMake), title: "Model")
                                                        
                            CustomTextField(text: $odometer, placeholder: "Odometer")
                            
                            CustomPicker(selectedValue: $selectedColor, values: viewModel.getColors(), title: "Color")
                            
                            CustomPicker(selectedValue: $selectedTransmission, values: viewModel.getTransmissions(), title: "Transmission")
                            
                            CustomPicker(selectedValue: $selectedYear, values: viewModel.getYears(), title: "Year")
                            
                            CustomPicker(selectedValue: $selectedState, values: viewModel.getStates(), title: "State")
                            
                            CustomTextField(text: $suburb, placeholder: "Suburb")
                            CustomTextField(text: $postcode, placeholder: "Postcode")
                            
                            
                            Button(action: {
                                ///add actions here
                            }) {
                                Text("Submit")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.orange)
                                    .cornerRadius(8)
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal)
                            }
                        }.padding(.top, 20)
                    }
                    .navigationBarHidden(true)
                }
            }
        }
    }
}
