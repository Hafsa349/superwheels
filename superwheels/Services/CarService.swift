//
//  CarService.swift
//  superwheels
//
//  Created by Hafsa Shariq on 19/11/2023.
//

import Foundation
import Firebase
final class CarService {
    @Published var brands: [Brand] = []
    let db = Firestore.firestore()
    
    func getBrands(completion: @escaping ([Brand]?, Error?) -> Void) {
        db.collection("cars").getDocuments { snapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                completion(nil, error)
            } else {
                var brands: [Brand] = []
                
                if let documents = snapshot?.documents {
                    brands = documents.compactMap { document in
                        let data = document.data()
                        if
                            let name = data["name"] as? String,
                            let modelsData = data["models"] as? [[String: Any]] // Assuming models are stored as an array of dictionaries
                        {
                            let models = modelsData.compactMap { modelData -> BrandModel? in
                                if let modelName = modelData["name"] as? String {
                                    return BrandModel(name: modelName)
                                }
                                return nil
                            }
                            return Brand(name: name, id: document.documentID, models: models)
                        } else {
                            return nil
                        }
                    }
                }
                
                completion(brands, nil)
            }
        }
    }
}
