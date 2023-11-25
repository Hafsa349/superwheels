//
//  BrandCars.swift
//  superwheels
//
//  Created by Syed Shariq on 26/11/2023.
//

struct BrandModel {
    let name: String
}

struct Brand {
    let name: String
    let id: String
    let imageUrl: String = ""
    let models: [BrandModel]
}
