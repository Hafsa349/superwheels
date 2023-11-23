//
//  HomeViewModel.swift
//  superwheels
//
//  Created by Syed Shariq on 17/11/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    //@Published var cardBalance: String = "$0.00"

    var homeModel: HomeModel
    init(homeModel: HomeModel) {
        self.homeModel = homeModel
    }
    func getCustomerName() -> String {
        return homeModel.customerName
    }
    func isLoggedIn() -> Bool {
        return homeModel.isLoggedIn
    }
}
