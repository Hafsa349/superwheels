//
//  HomeView.swift
//  superwheels
//
//  Created by Hafsa Shariq on 17/11/2023.
//

import SwiftUI
struct HomeUIView: View {
    
    @StateObject private var userViewModel = UserViewModel()
    @StateObject var sessionManager = SessionManager()
    let topBarHeight: CGFloat = 180 // Increased height for the top bar
    let islandHeight: CGFloat = 100 // Height of the island/banner
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                // Orange background on top with increased height
                Color.primaryOrange
                    .frame(height: topBarHeight)
                    .edgesIgnoringSafeArea(.top)
                    .zIndex(0) // Ensure it stays on top
                
                VStack(spacing: 10) {
                    // Text "SuperWheels" above the search box
                    
                    Image("LogoHorizontal")
                        .resizable()
                        .frame(width: 242.0, height: 84.0)
                    
                    // Search text box with search icon
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(height: 48)
                            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2) // Add shadow here
                        
                        HStack {
                            TextField("Search", text: $searchText)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 8)
                                .background(Color.white)
                                .cornerRadius(8)
                            
                            Button(action: {
                                // Perform search action here...
                                // For example: Implement the action to search based on searchText
                                print("Perform search for: \(searchText)")
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                   
                    ScrollView(.vertical, showsIndicators: false) {
                        if let customerName = userViewModel.getCustomerName() {
                            // Display user details if available
                            Text("Welcome, \(customerName)").font(.title)
                        } else {
                            // Placeholder or loading state while user details are being fetched
                            ProgressView("Loading ...")
                        }
                        
                        // Banner image without overlay
                        Image("HomeBanner")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: (geometry.size.width / 200) * 100)
                            .padding(.top, 120)
                            .offset(y: -topBarHeight / 2)
                            .zIndex(3) // Behind the search box and orange bar
                        Spacer()
                        
                        VStack(spacing: 0) {
                            // Scrollable horizontal list of brands
                            // Adjust spacing to remove space between elements
                            Text("Brands")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            // Reduce top padding to adjust spacing
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: [GridItem(.fixed(120))], spacing: 20) {
                                    // Replace the following image names with your actual brand images
                                    ForEach(0..<10) { index in
                                        Image("HomeBanner") // Replace with actual image names
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 120, height: 80)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }.padding(.top, -60).padding(.bottom, 0)
                        
                        VStack(spacing: 0) {
                            // Scrollable horizontal list of brands
                            // Adjust spacing to remove space between elements
                            Text("Featured Cars")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top, 8)
                                .alignmentGuide(HorizontalAlignment.leading) { d in d[HorizontalAlignment.leading] }
                            
                            // Reduce top padding to adjust spacing
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: [GridItem(.fixed(120))], spacing: 20) {
                                    // Replace the following image names with your actual brand images
                                    ForEach(0..<10) { index in
                                        Image("HomeBanner") // Replace with actual image names
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 120, height: 80)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                // Fetch user details when the view appears
                userViewModel.getUserDetails(for: sessionManager.getSessionId())
            }
        }
        .navigationBarHidden(true) // Hide the navigation bar
        
    }
}
