//
//  MainViewModel.swift
//  SocliaList
//
//  Created by Andrey Safronov on 12/11/2023.
//

import Foundation
import SwiftUI

class SocliaListViewModel: ObservableObject {
    @Published var listOfGroceries: [Groceries] = []
    
    func verifyUser() -> Bool{
        return true
    }
    
    func markGroceryAsPurchased(groceryListId: Groceries, groceryToToggle: Groceries.product) -> Bool{
        guard let gorceryListToToggle = (listOfGroceries.firstIndex{$0.id == groceryListId.id}) else {
            print("no such ID found")
            return true
        }
        let groceryToToggle = listOfGroceries[gorceryListToToggle].products.firstIndex{$0.name == groceryToToggle.name}
        listOfGroceries[gorceryListToToggle].products[groceryToToggle!].purchased.toggle()
        let testz = listOfGroceries[gorceryListToToggle].products.filter({$0.purchased  == false})
        print(testz)
        if testz.isEmpty {
            return false
        }
        return true
    }

    func deleteGroceryFromList(groceryList: Groceries, groceryTodelete: Groceries.product){
        guard let gorceryListToMOdify = (listOfGroceries.firstIndex{$0.id == groceryList.id}) else {
            print("no such ID found")
            return
        }
        listOfGroceries[gorceryListToMOdify].products = listOfGroceries[gorceryListToMOdify].products.filter{$0.name != groceryTodelete.name}
    }
    
    func loadDataIntoList() {
        if verifyUser() {
            listOfGroceries =  MockServicesDataServer().mockLogin(findIdofList: ["123","124","125"])
        }
    }
}

