//
//  SearchResultView.swift
//  superwheels
//
//  Created by Hafsa Shariq on 17/11/2023.
//

import SwiftUI

struct SearchResultUIView: View {
    let topBarHeight: CGFloat = 160 // Increased height for the top bar
    let cars = [
        Car(name: "Tesla Model S", imageUrl: "tesla_model_s", year: 2022, odometer: 5000, amount: 80000.0),
        Car(name: "BMW 5 Series", imageUrl: "bmw_5_series", year: 2023, odometer: 2000, amount: 70000.0),
          // Add more cars as needed
      ]
      
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
                            Text("Search result").font(.title)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.top, 40)
                                .padding(.leading, 16)
                            ForEach(cars) { car in
                                HStack(spacing: 15) {
                                    Image("HomeBanner")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(8)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Rav 4")
                                            .font(.headline)
                                        
                                        Text("Year: \(car.year)")
                                        
                                        Text("Odo: \(car.odometer) miles")
                                        
                                        Text("Amount: $\(car.amount, specifier: "%.2f")")
                                    }
                                    .padding(.vertical, 8)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity)
                                .background(Color.secondary.opacity(0.1))
                                .cornerRadius(12)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}
