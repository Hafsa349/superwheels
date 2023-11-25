//
//  SellCarViewModel.swift
//  superwheels
//
//  Created by Hafsa Shariq on 25/11/2023.
//

import Foundation

class CarsViewModel: ObservableObject {
    
    private var carService = CarService() // Your user service class
    @Published var brandNames: [String] = []
    @Published var brands: [Brand] = []
    @Published var models: [String] = []
    func getBrands() {
        // Assuming you're using the getBrands function from before
        carService.getBrands { retrievedBrands, error in
            if let error = error {
                // Handle the error
                print("Error: \(error)")
            } else if let retrievedBrands = retrievedBrands {
                // Update brands when data is retrieved
                self.brands = retrievedBrands
                self.brandNames = []
                for brand in retrievedBrands {
                    self.brandNames.append(brand.name)
                }
            }
        }
    }
    
    func getTransmissions() -> [String] {
        return [
            "Automatic",
            "Manual"
        ]
    }
    
    func getStates() -> [String] {
        return ["NSW", "ACT", "TAS", "VIC", "NT", "WA", "QLD"]
    }
    
    func getColors() -> [String] {
        return [
            "White", "Black", "Silver", "Gray", "Red", "Blue", "Green", "Yellow", "Orange",
            "Brown", "Beige", "Gold", "Bronze", "Purple", "Pink", "Champagne", "Charcoal",
            "Gunmetal", "Titanium", "Pearl White", "Metallic Black", "Metallic Silver",
            "Metallic Blue", "Metallic Red", "Metallic Gray", "Metallic Green", "Metallic Gold",
            "Metallic Copper", "Metallic Bronze", "Metallic Orange"
        ]
    }
    
    
    func getCarModels(for selectedCarMake: String) -> [String] {
        // Find the selected car make in the array of brands
            if let selectedBrand = self.brands.first(where: { $0.name == selectedCarMake }) {
                // Extract model names from the selected brand's models array
                let modelNames = selectedBrand.models.map { $0.name }
                return modelNames
            } else {
                return [] // Return an empty array if the selected car make is not found
            }
    }

    
    
    func getYears() -> [String] {
        let currentYear = Calendar.current.component(.year, from: Date())
        var years = [String]()
        
        for year in 1990...currentYear {
            years.append(String(year))
        }
        
        return years
    }
}
