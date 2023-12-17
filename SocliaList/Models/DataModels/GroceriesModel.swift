//
//  GroceriesModel.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import Foundation

struct Groceries: Identifiable {
    var id: String
    var products: [product]
    var allProductsMarkedPurchased: Bool = false
    struct product {
        var name: String
        var purchased: Bool = false
    }
}
